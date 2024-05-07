import codecs
import os
import sys

from unidiff import PatchSet

if len(sys.argv) == 1:
    print("Usage: python patch.py <patch_path>")
    sys.exit(1)

patch = PatchSet.from_filename(sys.argv[1], encoding="utf-8-sig")

for patched_file in patch:
    print(f"Patching {os.path.abspath(patched_file.path)}")
    if not os.path.exists(patched_file.path):
        print(f"Skip: {patched_file.path} does not exist")
        continue

    with open(patched_file.path, "rb") as f:
        raw = f.read(4)
    if raw.startswith(codecs.BOM_UTF8):
        encoding = "utf-8-sig"
    else:
        encoding = "utf-8"

    with open(patched_file.path, "r", encoding=encoding) as f:
        lines = f.readlines()

    has_error = False
    for hunk in patched_file:
        for i in range(hunk.source_length):
            if lines[hunk.source_start - 1 + i].strip() != hunk.source[i].strip():
                # print(f"Error: {patched_file.path} has conflict.")
                # print(f"{lines[hunk.source_start - 1 + i]} != {hunk.source[i]}")
                has_error = True
                break
        for line in hunk:
            if line.is_added:
                lines.insert(line.target_line_no - 1, line.value)
            elif line.is_removed:
                if lines[line.target_line_no - 1] != line.value:
                    # print(f"Error: {patched_file.path} has conflict\n{lines[line.target_line_no - 1]} != {line.value}")
                    has_error = True
                    break
                del lines[line.target_line_no - 1]
    if not has_error:
        with open(patched_file.path, "w", encoding=encoding) as f:
            f.writelines(lines)
        print(f"Patched {os.path.abspath(patched_file.path)}")
