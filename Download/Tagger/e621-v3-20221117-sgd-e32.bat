@echo off
chcp 65001 > NUL

echo "e621-v3-20221117-sgd-e32 を導入するには Civitai の Discord に参加して、チャンネルで紹介されている Mega ( https://mega.nz/folder/2hFTTZRC#Fkgq0GTSGh93Ve_YOrPrAA ) からモデルの Zip ファイルをダウンロードし、所定のフォルダ ( SdxlWebUi/TaggerDeepDanboooru/ ) に展開する必要があります。"
echo "事前に Discord がインストールされている必要があります。 https://discord.com/ <- Ctrl + Click"
echo "よろしいですか？ [y/n]"
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( exit /b 1 )

echo "Discord の Civitai チャンネルに参加してください。参加して最初の質問に答え終わったらキーを押して進みます。"
start "" https://discord.com/invite/civitai
pause

echo "Civitai チャンネルの書き込みから Mega のリンク ( https://mega.nz/folder/2hFTTZRC#Fkgq0GTSGh93Ve_YOrPrAA ) にある e621-v3-20221117-sgd-e32.zip をダウンロードしてください。"
start "" https://discord.com/channels/1037799583784370196/1037799583784370202/1145823469494341714

echo "e621-v3-20221117-sgd-e32.zip を SdxlWebUi\TaggerDeepDanboooru\ に展開してください。"
echo "SdxlWebUi\TaggerDeepDanboooru\e621-v3-20221117-sgd-e32\project.json となるように展開後のフォルダ階層を調整してください"
echo "正常に導入できていれば「タグ付け」タブの「インテロゲーター（要右側更新ボタン）」に 「e621-v3-20221117-sgd-e32」 が追加されます。"
set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
explorer "%SDXL_WEB_UI%\TaggerDeepDanboooru"

pause
