import sys
from huggingface_hub import snapshot_download

if len(sys.argv) < 3:
    print("Usage: download_huggingface.py <local_dir> <repo_id> [<allow_patterns>...]")
    sys.exit(1)

local_dir = sys.argv[1]
repo_id = sys.argv[2]
allow_patterns = ["*"]
if len(sys.argv) > 3:
    allow_patterns = sys.argv[3:]
# 差分ダウンロード時に再ダウンロードを防ぐため、シンボリックリンクを使用する
# local_dir_use_symlinks = False

print("huggingface_hub.snapshot_download(")
print(f'    local_dir="{local_dir}",')
print(f'    repo_id="{repo_id}",')
print(f"    allow_patterns={allow_patterns},")
# print(f"    local_dir_use_symlinks={local_dir_use_symlinks},")
print(")")

path = snapshot_download(
    local_dir=local_dir,
    repo_id=repo_id,
    allow_patterns=allow_patterns,
    # local_dir_use_symlinks=local_dir_use_symlinks,
)
