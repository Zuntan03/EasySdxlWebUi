# EasySdxlWebUi

概要は [こちら](https://twitter.com/Zuntan03/status/1746426606456127804)。

![EasySdxlWebUi](./SdxlWebUi/setup/doc/EasySdxlWebUi.webp)

EasySdxlWebUi は簡単に SDXL で画像を生成できるようにします。  

- ワンクリックインストーラーで古いパソコンでも動作する [forge 版](https://github.com/lllyasviel/stable-diffusion-webui-forge) と、実績のある [AUTOMATIC1111 版(a1111)](https://github.com/AUTOMATIC1111/stable-diffusion-webui) に両対応しており、簡単に使い始められます。
	- forge と a1111 で多くの設定を共有しており、気軽に両方を使い分けられます。
- 画像の生成にはインストールだけでなく、web UI の設定、拡張機能のインストールと設定、モデルなどの入手、適切なパラメータ設定などが必要になりますが、これも自動的に設定します。
	- 中身は通常の web UI と同一ですので、経験が後々無駄になることもありません。

**インストール方法は [こちら](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)**

## 最近の主な更新

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

### 2024/02/11

- `Download` に `Model` や `Lora` をダウンロードする bat を追加しました。
	- Civitai でログインしないとダウンロードできないコンテンツが増えていますので、bat でのダウンロードをどんどん増やすのは難しそうです。
- `config.json` と `ui-config.json` の上書き設定に対応しました。
	- `SdxlWebUi/config.json` や `SdxlWebUi/ui-config.json` に設定を書き加えると、起動時に forge と a1111 の両方に設定を適用します。
- ダウンロードを高速化しました。

### 2024/02/10

- huggingface_hub で HuggingFace のファイルを一括ダウンロードする機能を追加しました。
	- `Download/ControlNet/lllyasviel-sd_control_collection.bat` で [lllyasviel/sd_control_collection](https://huggingface.co/lllyasviel/sd_control_collection) の XL 用 ControlNet モデルを一括ダウンロードします。
		- forge で ip-adapter_xl が動作しないようです。
	- `Download/Lora/2vXpSwA7-iroiro-lora.bat` で [2vXpSwA7/iroiro-lora](https://note.com/2vxpswa7/n/n046c3e928f1e) の XL 用 LoRA を一括ダウンロードします。
	- HuggingFace 一括ダウンロードのおすすめがありましたら、お知らせください。

### 2024/02/09

- lllyasviel 氏による [stable-diffusion-webui-forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) により、[古いパソコンでも SDXL による画像生成を楽しめるようになりました](https://twitter.com/Zuntan03/status/1755898971195900249)。
	- forge 対応に合わせてドキュメントを整備し直しました。
- hakomikan 氏による [sd-webui-prevent-artifact](https://github.com/hako-mikan/sd-webui-prevent-artifact) の導入と有効化に対応しました。
	- 詳細な解説は[こちら](https://note.com/hakomikan/n/nb6dd68a1bd9e)。

## ドキュメント

### セットアップ

- [EasySdxlWebUi のインストール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
	- EasySdxlWebUi のインストール方法の説明です。  
	インストールのトラブルシューティングもこちら。
- [Animagine で最初の画像生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7%E6%9C%80%E5%88%9D%E3%81%AE%E7%94%BB%E5%83%8F%E7%94%9F%E6%88%90)
	- インストール後に Animagine XL 3.0 最初の画像を生成する手順です。
- [先人の知見を参考にする](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E5%85%88%E4%BA%BA%E3%81%AE%E7%9F%A5%E8%A6%8B%E3%82%92%E5%8F%82%E8%80%83%E3%81%AB%E3%81%99%E3%82%8B)
	- まずは先人の真似をしつつ、少しずつプロンプトを変えてみるところから始めましょう。


### EasySdxlWebUi

- [EasySdxlWebUi のしくみ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF)
	- 「EasySdxlWebUi のインストールや設定の自動化って、何か変なことをしていないか心配…」な方へ。

### Animagine

- [Animagine のルール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%AB)
	- Animagine XL 3.0 を SdxlWebUi で利用する際の、プロンプトや設定のルールです。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
