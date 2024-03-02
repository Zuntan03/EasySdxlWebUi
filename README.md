# EasySdxlWebUi

概要: [PC Watch (2/14)](https://twitter.com/Zuntan03/status/1757707024958464163), [forge (2/9)](https://twitter.com/Zuntan03/status/1755898971195900249), [AUTOMATIC1111 (1/14)](https://twitter.com/Zuntan03/status/1746=426606456127804)

![EasySdxlWebUi](./SdxlWebUi/setup/doc/EasySdxlWebUi.webp)

EasySdxlWebUi は簡単に SDXL で画像を生成できるようにします。  

- ワンクリックインストーラーで古いパソコンでも動作する [forge 版](https://github.com/lllyasviel/stable-diffusion-webui-forge) と、実績のある [AUTOMATIC1111 版(a1111)](https://github.com/AUTOMATIC1111/stable-diffusion-webui) に両対応しており、簡単に使い始められます。
	- **forge と a1111 で多くの設定を共有しており、気軽に両方を使い分けられます。**
- 画像の生成にはインストールだけでなく、web UI の設定、拡張機能のインストールと設定、モデルなどの入手、適切なパラメータ設定などが必要になりますが、これも自動的に設定します。
	- **web UI の本体は通常の web UI と完全に同一ですので、経験が後々無駄になることもありません。**

**インストール方法は [こちら](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)**

## 最近の主な更新

### 2024/03/02

- forge 版の拡張機能に [sd-forge-layerdiffusion](https://github.com/layerdiffusion/sd-forge-layerdiffusion) を追加しました。
	- Animagine + LCM や Pony + Lightning でも正常動作しています。
	- [基本機能: `Layer Diffusion` つぶやき](https://twitter.com/Zuntan03/status/1763585228763984108)
	- [背景書き足し: `Layer Diffusion` の `From Foreground to Blending` つぶやき](https://twitter.com/Zuntan03/status/1763614528695374112)
	- [キャラ入れ替え: `Layer Diffusion` の `From Foreground and Blending to Background` つぶやき](https://twitter.com/Zuntan03/status/1763643060238610448)

|Animagine + LCM<br>C.C. サンプルから背景抜き|Animagine + LCM<br>[写真背景素材](https://www.pexels.com/ja-jp/photo/1916816/)の上に<br>カナサンプルを生成|Pony + Lightning<br>gyaru からプロンプトを<br>アップサンプル|
|:--:|:--:|:--:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/LayerAnimagineLCM.png)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/LayerPhotoBG.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/LayerPonyLightning.png)|

- a1111 版でバージョン 1.8.0 に対応しました。
	- **！！注意事項！！**
		- **更新する際に venv `SdxlWebUi/venv-a1111/` を削除してください。**
		- **LCM LoRA用の `LCM Karras`、Lightning LoRA用の `(Euler|Euler A|DPM++ 2M|DPM++ 2M SDE) SGMUniform` のサンプラーは a1111 にはありません。これらを利用したい場合は forge 版をご利用ください。**
		- **fp8 と fp8 利用時に LoRA の効果を維持する（代わりにメインメモリを消費）オプションを有効にしています。**
			- fp8 を無効にするには `SdxlWebUi/config.json` に `"fp8_storage": "Disable",` と `"cache_fp16_weight": false,` を加えてください。
	- `LCM` サンプラーのために導入していた sd-webui-animatediff 拡張をインストールしないようにしました。
	- 更新で不要になった sd-webui-prevent-artifact 拡張をインストールしないようにしました。

### 2024/03/01

- 拡張機能に [Weight Helper](https://github.com/nihedon/sd-webui-weight-helper) を追加しました。
	- プロンプト入力欄の `<lora:lora_name:1>` といった表記を右クリックすると、GUI で LoRA のパラメータを調整できます。
	- `show extra options` で `Start` や `Stop` も調整できます。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/WeightHelper.png)

### 2024/02/27

- すべてをダウンロードしようとする `DownloadAll.bat` を用意しました。
	- 大量のストレージを消費しますので、ご注意ください（数百GB オーダー）。
	- この対応に伴い Animagine 系モデルを `Model/Anmg/` に、Pony 系モデルを `Model/Pony/` に保存するようにしました。  
	`Model/` にある重複したモデルは削除するか、`Model/Anmg/` や `Model/Pony/` に移動してください。
- [bdsqlsz/qinglong_controlnet-lllite](https://huggingface.co/bdsqlsz/qinglong_controlnet-lllite) の ControlNet モデルをダウンロードする `Download/ControlNet/bdsqlsz-qinglong_controlnet-lllite.bat` を追加しました。

### 2024/02/26

- 利用者の環境によっては問題が起こり得る設定を見直しました。
	- `高解像度補助`(Hires-Fix) をデフォルトで無効にしました。
	- `ADetailer` をデフォルトで無効にしました。
	- 影響はあるが効果を手元で確認できなかった `sd-webui-cutoff` をインストール対象から外しました。
	- `sd-webui-supermerger` と役割が被っている `stable-diffusion-webui-model-toolkit` をインストール対象から外しました。
	- 手元の環境では起動時にリロードを必要とする `sd-webui-traintrain` を無効化しました。`拡張機能` タブから有効にできます。


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
