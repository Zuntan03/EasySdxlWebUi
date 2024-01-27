import json
import sys

with open(sys.argv[1], "r", encoding="utf-8") as src_file:
    with open(sys.argv[2], "r+", encoding="utf-8") as dst_file:
        src_data = json.load(src_file)
        dst_data = json.load(dst_file)
        dst_data.update(src_data)
        dst_file.seek(0)
        json.dump(dst_data, dst_file, indent=4)
        dst_file.truncate()
