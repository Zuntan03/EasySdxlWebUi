import codecs
import os
import sys

from unidiff import PatchSet

if len(sys.argv) == 1:
    print("Usage: python patch.py <patch_path>")
    sys.exit(1)

patch = PatchSet.from_filename(sys.argv[1], encoding="utf-8-sig")

for patched_file in patch:
    print(f"Unpatching {os.path.abspath(patched_file.path)}")
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
    for hunk in reversed(patched_file):
        for line in reversed(hunk):
            if line.is_added:
                if lines[line.target_line_no - 1] != line.value:
                    # print(f"Error: {patched_file.path} has conflict\n{lines[line.target_line_no - 1]} != {line.value}")
                    has_error = True
                    break
                del lines[line.target_line_no - 1]
            elif line.is_removed:
                lines.insert(line.target_line_no - 1, line.value)
    if not has_error:
        with open(patched_file.path, "w", encoding=encoding) as f:
            f.writelines(lines)
        print(f"Unpatched {os.path.abspath(patched_file.path)}")
