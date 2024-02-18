# EasySdxlWebUi

概要: [PC Watch (2/14)](https://twitter.com/Zuntan03/status/1757707024958464163), [forge (2/9)](https://twitter.com/Zuntan03/status/1755898971195900249), [AUTOMATIC1111 (1/14)](https://twitter.com/Zuntan03/status/1746=426606456127804)

![EasySdxlWebUi](./SdxlWebUi/setup/doc/EasySdxlWebUi.webp)

EasySdxlWebUi は簡単に SDXL で画像を生成できるようにします。  

- ワンクリックインストーラーで古いパソコンでも動作する [forge 版](https://github.com/lllyasviel/stable-diffusion-webui-forge) と、実績のある [AUTOMATIC1111 版(a1111)](https://github.com/AUTOMATIC1111/stable-diffusion-webui) に両対応しており、簡単に使い始められます。
	- forge と a1111 で多くの設定を共有しており、気軽に両方を使い分けられます。
- 画像の生成にはインストールだけでなく、web UI の設定、拡張機能のインストールと設定、モデルなどの入手、適切なパラメータ設定などが必要になりますが、これも自動的に設定します。
	- 中身は通常の web UI と同一ですので、経験が後々無駄になることもありません。

**インストール方法は [こちら](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)**

## 最近の主な更新

### 2024/02/18

- forge 対応時あたりから EasySdxlWebUi を利用していた場合に、正常に更新できない不具合を修正しました。
	- インストール先に `SdxlWebUi-Update-a1111.bat` がなく、`SdxlWebUi-Update.bat` で更新されている方が不具合の対象です。
	- 以降は `SdxlWebUi-Update.bat` で正常に更新され、`SdxlWebUi-Update-a1111.bat` や `SdxlWebUi-Update-forge.bat` で更新できるようになります。
		- `SdxlWebUi-Update-a1111.bat` や `SdxlWebUi-Update-forge.bat` による更新で、不要となった `SdxlWebUi-Update.bat` や `SdxlWebUi.bat` を削除します。
- ドキュメントに『[モデルや LoRA の追加](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-LoRA-%E3%81%AE%E8%BF%BD%E5%8A%A0)』を追加しました。
	- Civitai Helper の API キーを登録していますか？ファイルコピーだけじゃないモデルや LoRA の追加方法です。
- ドキュメントに『[EasySdxlWebUi のカスタマイズ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA)』を追加しました。
	- Web UI 起動時の初期パラメータを変更したり、自分用のボタン入力を追加したりできます。
- スタイルファイルを `SdxlWebUi/styles.csv` を参照するように変更しました。
	- すでに forge や a1111 で `styles.csv` を利用していた場合は、`SdxlWebUi/stable-diffusion-webui-forge/styles.csv` や `SdxlWebUi/stable-diffusion-webui/styles.csv` を `SdxlWebUi/styles.csv` にコピーしてください。

### 2024/02/17

- `Easy Prompt Selector` の `Animagine XL 3.0.yml` と `Pony Diffusion V6 XL.yml` に、SDXL 用画像サイズを指定するボタンを追加しました。
	- `896x1152` などのサイズ指定ボタンのあとに `生成` ボタン左下の矢印ボタンで適用します。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/SetSize.png)
- e621 のタグ付けに対応しました。
	- `Download/Tagger` の bat ファイルでモデルをダウンロードした後に、`タグ付け` タブの `インタロゲーター` で選択できます。
- `Download/Model/` のモデルバージョンを更新しました。
- forge と a1111 の `style.csv` 同期に不具合があったため無効化しました。

### 2024/02/15

-  [拡張機能のひとこと紹介](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%81%AE%E3%81%B2%E3%81%A8%E3%81%93%E3%81%A8%E7%B4%B9%E4%BB%8B) を追加しました。
- `Download/Lora/MayonakaManic-LoRA.bat` に `LECO_LessMonsterGirlsXL.safetensors` と `LECO_LessChibiAndDollsXL.safetensors` を追加しました。

### 2024/02/14

- 「[EasySdxlWebUi のインストール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)」に「[すでにご利用中の Stable Diffusion Web UI からモデルや LoRA などを共有する](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB#%E3%81%99%E3%81%A7%E3%81%AB%E3%81%94%E5%88%A9%E7%94%A8%E4%B8%AD%E3%81%AE-stable-diffusion-web-ui-%E3%81%8B%E3%82%89%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-lora-%E3%81%AA%E3%81%A9%E3%82%92%E5%85%B1%E6%9C%89%E3%81%99%E3%82%8B)」を追記しました。
- 「EasySdxlWebUi のインストールや設定の自動化って、何か変なことをしていないか心配…」な方へ「[EasySdxlWebUi のしくみ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF)」を用意しました。
- forge と a1111 の間で `style.csv` の同期に対応しました。

### 2024/02/13

- [sdweb-easy-generate-forever](https://github.com/blue-pen5805/sdweb-easy-generate-forever) 拡張機能の追加。
- [`LECO_LessMuscularityXL_forPony.safetensors`](https://huggingface.co/MayonakaManic/LoRA) のダウンロードを `Download/Lora/MayonakaManic-LessMuscularityXL.bat` に追加。
- [`ebara_pony_1.safetensors`](https://huggingface.co/tsukihara/xl_model) をダウンロードする `Download/Model/ebara_pony.bat` を追加。
- [`rumblexl_v11.safetensors`](https://civitai.com/models/296650) をダウンロードする `Download/Model/rumblexl.bat` を追加。

### 2024/02/12

- 「サンプル画像が生成できても、次に何をしたらよいかわからない」な方へ「[先人の知見を参考にする](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E5%85%88%E4%BA%BA%E3%81%AE%E7%9F%A5%E8%A6%8B%E3%82%92%E5%8F%82%E8%80%83%E3%81%AB%E3%81%99%E3%82%8B)」を用意しました。
- Civitai Helper を[ぶるぺんさんの fork 版](https://github.com/blue-pen5805)に変更しました。
	- forge で Civitai Helper の便利なボタンが表示されます。
- forge 版に `sd-webui-prevent-artifact` が取り込まれたことへの対処。

[過去の更新](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0)

## ドキュメント

### はじめに

- [EasySdxlWebUi のインストール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
	- EasySdxlWebUi のインストール方法の説明とトラブルシューティングです。  
- [Animagine で最初の画像生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7%E6%9C%80%E5%88%9D%E3%81%AE%E7%94%BB%E5%83%8F%E7%94%9F%E6%88%90)
	- インストール後に Animagine XL 3.0 最初の画像を生成する手順です。
- [先人の知見を参考にする](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E5%85%88%E4%BA%BA%E3%81%AE%E7%9F%A5%E8%A6%8B%E3%82%92%E5%8F%82%E8%80%83%E3%81%AB%E3%81%99%E3%82%8B)
	- まずは先人の真似をしつつ、少しずつプロンプトを変えてみるところから始めましょう。
- [モデルや LoRA の追加](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-LoRA-%E3%81%AE%E8%BF%BD%E5%8A%A0)
	- Civitai Helper の API キーを登録していますか？ファイルコピーだけじゃないモデルや LoRA の追加方法です。

### EasySdxlWebUi

- [EasySdxlWebUi のカスタマイズ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA)
	- Web UI 起動時の初期パラメータを変更したり、自分用のボタン入力を追加したりできます。
- [EasySdxlWebUi のしくみ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF)
	- 「EasySdxlWebUi のインストールや設定の自動化って、何か変なことをしていないか心配…」な方へ。
-  [拡張機能のひとこと紹介](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%81%AE%E3%81%B2%E3%81%A8%E3%81%93%E3%81%A8%E7%B4%B9%E4%BB%8B)
	- EasySdxlWebUi が自動的にインストールする数々の拡張機能についてのひとこと紹介です。
- [過去の更新](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0)
	- 過去の更新履歴です。

### Animagine

- [Animagine のルール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%AB)
	- Animagine XL 3.0 を SdxlWebUi で利用する際の、プロンプトや設定のルールです。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
