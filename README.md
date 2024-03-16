﻿# EasySdxlWebUi

概要: [PC Watch (2/14)](https://twitter.com/Zuntan03/status/1757707024958464163), [forge (2/9)](https://twitter.com/Zuntan03/status/1755898971195900249), [AUTOMATIC1111 (1/14)](https://twitter.com/Zuntan03/status/1746=426606456127804)

![EasySdxlWebUi](./SdxlWebUi/setup/doc/EasySdxlWebUi.webp)

EasySdxlWebUi は簡単に SDXL で画像を生成できるようにします。  

- ワンクリックインストーラーで古いパソコンでも動作する [forge 版](https://github.com/lllyasviel/stable-diffusion-webui-forge) と、実績のある [AUTOMATIC1111 版(a1111)](https://github.com/AUTOMATIC1111/stable-diffusion-webui) に両対応しており、簡単に使い始められます。
	- **forge と a1111 で多くの設定を共有しており、気軽に両方を使い分けられます。**
- 画像の生成にはインストールだけでなく、web UI の設定、拡張機能のインストールと設定、モデルなどの入手、適切なパラメータ設定などが必要になりますが、これも自動的に設定します。
	- **web UI の本体は通常の web UI と完全に同一ですので、経験が後々無駄になることもありません。**

**インストール方法は [こちら](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)。**

## **[トラブルシューティング](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**

ホットな事案

- **拡張機能の更新時にエラーが発生した場合は、`SdxlWebUi/stable-diffusion-webui(-forge)/extensions/` にある拡張機能のフォルダを削除して再更新してください。**

## 最近の主な更新

### 2024/03/16

- ドキュメントに『[Pony 系モデルの画風めぐり（Dynamic Prompts 組み合わせ生成）](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Pony-%E7%B3%BB%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AE%E7%94%BB%E9%A2%A8%E3%82%81%E3%81%90%E3%82%8A%EF%BC%88Dynamic-Prompts-%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E7%94%9F%E6%88%90%EF%BC%89) 』を追加しました。
	- [PonyXL Notes](https://rentry.org/ponyxl_loras_n_stuff) で共有されている画風プロンプトを、Dynamic Prompts の組み合わせ生成で全種類一括生成します。
- ドキュメントに『[トラブルシューティング](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0) 』を追加しました。
	- インストールやアップデートや利用中の、よくあるトラブルへの対処集です。
- [起動時に sd-danbooru-tags-upsampler のエラーが発生する問題](https://github.com/p1atdev/sd-danbooru-tags-upsampler/issues/21) に対処しました。

### 2024/03/15

- [NegPiP が動作しない問題](https://github.com/hako-mikan/sd-webui-negpip/issues/36#issuecomment-1995255830) への対処のために、forgeのバージョンを `b9705c5` にする対処を入れました。
	- [Regional Prompter の問題](https://github.com/lllyasviel/stable-diffusion-webui-forge/issues/515#issuecomment-1986967238) も治るかもしれません。

### 2024/03/10

- ドキュメントに『[SDXL 生成画像を SD1.5 画風に寄せる](https://github.com/Zuntan03/EasySdxlWebUi/wiki/SDXL-%E7%94%9F%E6%88%90%E7%94%BB%E5%83%8F%E3%82%92-SD1.5-%E7%94%BB%E9%A2%A8%E3%81%AB%E5%AF%84%E3%81%9B%E3%82%8B)』を追加しました。
	- Animagine 系や Pony 系の SDXL で生成した画像を、`高解像度補助` で SD1.5 モデルの画風に寄せます。  
	- SDXL と SD1.5 を 組み合わせることで、SD1.5 の資産を SDXL 環境でも活用できるようにします。

左上が Animagine による元画像  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/Sd15HiresW.webp)

### 2024/03/09

- **更新時に `sd-danbooru-tags-upsampler` でエラーが発生した場合は、`SdxlWebUi/stable-diffusion-webui(-forge)/extensions/sd-danbooru-tags-upsampler/` を削除して再更新してください。**
- `タグ付け` の `インタロゲーター` に、新しい `WD14 ConvNeXT v3`, `WD14 SwinV2 v3`, `WD14 ViT v3` を追加しました。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/Wd14TaggerV3.png)
- ドキュメントに 『[モデルに VAE を焼き込む](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AB-VAE-%E3%82%92%E7%84%BC%E3%81%8D%E8%BE%BC%E3%82%80)』手順を追加しました。
	- SDXL と SD1.5 を組み合わせる場合などに VAE を焼き込みます。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/BKVE/BakeVae.png)

### 2024/03/07

- `高解像度補助` でモデルやプロンプトなどを設定する UI をデフォルトで表示するようにしました。
	- 無効にしたい場合は `SdxlWebUi/config.json` に `"hires_fix_show_sampler": false,` と `"hires_fix_show_prompts": false,` を追加します。
- [EasySdxlWebUi のカスタマイズ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA#%E8%A8%AD%E5%AE%9A-%E3%82%BF%E3%83%96%E3%81%AE%E5%A4%89%E6%9B%B4%E3%82%92%E6%AE%8B%E3%81%99) にブラウザの自動起動を無効にする設定の説明を追加しました。
	- `SdxlWebUi/config.json` に `"auto_launch_browser": "Disable",` を追加します。
		- `http://127.0.0.1:7860/` をブックマークしてご利用ください。

### 2024/03/06

- [Animagine で Tile アップスケール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7-Tile-%E3%82%A2%E3%83%83%E3%83%97%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%AB)
	- SD1.5 の 『[高コスパ！簡単ゴージャスアップスケール！](https://twitter.com/Zuntan03/status/1665553153654411265)』のように、Animagine で生成した画像を `高解像度補助`(Hires fix) と ControlNet の Tile でアップスケールします。
	- 4K 超えの画像を 2分程度でアップスケールできています（forge、Geforce RTX 3060 12GB）。  
		- SDXL なのに SD1.5 当時より 3倍速く、技術の進化を感じます。

|[キャラ imgsli 比較](https://imgsli.com/MjQ0OTM5)|[背景 imgsli 比較](https://imgsli.com/MjQ0OTQx)|
|:--:|:--:|
|[![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/UPSC/char_upscale.webp)](https://imgsli.com/MjQ0OTM5)|[![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/UPSC/bg_upscale.webp)](https://imgsli.com/MjQ0OTQx)|

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
- [Danbooru Tags Upsampler でかんたん高品質プロンプトガチャ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Danbooru-Tags-Upsampler-%E3%81%A7%E3%81%8B%E3%82%93%E3%81%9F%E3%82%93%E9%AB%98%E5%93%81%E8%B3%AA%E3%83%97%E3%83%AD%E3%83%B3%E3%83%97%E3%83%88%E3%82%AC%E3%83%81%E3%83%A3)
	- [Platさん](https://twitter.com/p1atdev_art) の [Danbooru Tags Upsampler](https://github.com/p1atdev/sd-danbooru-tags-upsampler) はプロンプト生成専用の言語モデルにより、とても簡単に高品質なプロンプトでガチャれます。
- [トラブルシューティング](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)
	- インストールやアップデートや利用中の、よくあるトラブルへの対処集です。

### EasySdxlWebUi

- [EasySdxlWebUi のカスタマイズ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA)
	- Web UI 起動時の初期パラメータを変更したり、自分用のボタン入力を追加したりできます。
- [EasySdxlWebUi のしくみ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%81%97%E3%81%8F%E3%81%BF)
	- 「EasySdxlWebUi のインストールや設定の自動化って、何か変なことをしていないか心配…」な方へ。
-  [拡張機能のひとこと紹介](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%81%AE%E3%81%B2%E3%81%A8%E3%81%93%E3%81%A8%E7%B4%B9%E4%BB%8B)
	- EasySdxlWebUi が自動的にインストールする数々の拡張機能についてのひとこと紹介です。
- [モデルに VAE を焼き込む](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AB-VAE-%E3%82%92%E7%84%BC%E3%81%8D%E8%BE%BC%E3%82%80)
	- モデルに VAE を焼き込む手順です。SDXL と SD1.5 を組み合わせる場合などに VAE を焼き込みます。
- [SDXL 生成画像を SD1.5 画風に寄せる](https://github.com/Zuntan03/EasySdxlWebUi/wiki/SDXL-%E7%94%9F%E6%88%90%E7%94%BB%E5%83%8F%E3%82%92-SD1.5-%E7%94%BB%E9%A2%A8%E3%81%AB%E5%AF%84%E3%81%9B%E3%82%8B)
	- Animagine 系や Pony 系の SDXL で生成した画像を、`高解像度補助` で SD1.5 モデルの画風に寄せます。  
	- SDXL と SD1.5 を 組み合わせることで、SD1.5 の資産を SDXL 環境でも活用できるようにします。
- [過去の更新](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0)
	- 過去の更新履歴です。

### Animagine

- [Animagine のルール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%AB)
	- Animagine XL 3.0 を SdxlWebUi で利用する際の、プロンプトや設定のルールです。
- [Animagine で Tile アップスケール](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7-Tile-%E3%82%A2%E3%83%83%E3%83%97%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%AB)
	- SD1.5 の 『[高コスパ！簡単ゴージャスアップスケール！](https://twitter.com/Zuntan03/status/1665553153654411265)』のように、Animagine で生成した画像を `高解像度補助`(Hires fix) と ControlNet の Tile でアップスケールします。

### Pony Diffusion

- [Pony 系モデルの画風めぐり（Dynamic Prompts 組み合わせ生成）](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Pony-%E7%B3%BB%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AE%E7%94%BB%E9%A2%A8%E3%82%81%E3%81%90%E3%82%8A%EF%BC%88Dynamic-Prompts-%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E7%94%9F%E6%88%90%EF%BC%89)
	- [PonyXL Notes](https://rentry.org/ponyxl_loras_n_stuff) で共有されている画風プロンプトを、Dynamic Prompts の組み合わせ生成で全種類一括生成します。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
