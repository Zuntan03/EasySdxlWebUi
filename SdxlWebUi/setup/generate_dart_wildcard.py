import re
import time

import torch
from transformers import AutoModelForCausalLM, AutoTokenizer, GenerationConfig

print("Generate Dart prompts wildcard.")

copyright = ""
character = ""
length = "long"  # very_short, short, long, very_long
rating = "rating:nsfw, rating:explicit"
num_prompt = 20
prompt = "1girl"

generation_config = GenerationConfig(
    max_new_tokens=128,
    min_new_tokens=0,
    do_sample=True,
    temperature=1.0,
    top_p=1,
    top_k=20,
    num_beams=1,
    guidance_scale=1.5,
)

if input("SFW? (y/n) (default: NSFW): ") == "y":
    rating = "rating:sfw, rating:general"

try:
    num_prompt = int(input(f"Number of prompts in wildcard? (default: {num_prompt}): "))
except:
    print(f"Invalid input. Using default value: {num_prompt}")

in_prompt = input(f"Prompt? (default: {prompt}): ")
if in_prompt != "":
    prompt = in_prompt
prompt = prompt.strip()
if prompt.endswith(","):
    prompt = prompt[:-1]
file_name = prompt.replace(", ", ",")
file_name = re.sub(r'[ \\/:*?"<>|]', "_", file_name)

input_prompt = f"<|bos|><rating>{rating}</rating><copyright>{copyright}</copyright><character>{character}</character><general><|long|>{prompt}<|input_end|>"
print(f"----\n{input_prompt}\n----")

start_time = time.perf_counter()
MODEL_NAME = "p1atdev/dart-v1-sft"
model = AutoModelForCausalLM.from_pretrained(MODEL_NAME)
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, trust_remote_code=True)
input_ids = tokenizer(input_prompt, return_tensors="pt").input_ids

results = []
with torch.no_grad():
    for i in range(num_prompt):
        outputs = model.generate(input_ids, generation_config=generation_config)
        result = tokenizer.decode(outputs[0], skip_special_tokens=False)
        result = result[(result.index("<|input_end|>") + len("<|input_end|>")) : result.index("</general>")]
        if result.startswith(", "):
            result = result[2:]
        if result.endswith(", "):
            result = result[:-2]
        results.append(f"{prompt}, {result}")
        print(f"\n{i + 1}/{num_prompt}: {result}")

with open(f"{file_name}.txt", "w", encoding="utf-8-sig") as f:
    f.write("\n".join(results))

print(f"{file_name}.txt: {time.perf_counter() - start_time:.2f}s")
