# EasySdxlWebUi

概要: [PC Watch (2/14)](https://twitter.com/Zuntan03/status/1757707024958464163), [forge (2/9)](https://twitter.com/Zuntan03/status/1755898971195900249), [AUTOMATIC1111 (1/14)](https://twitter.com/Zuntan03/status/1746=426606456127804)

![EasySdxlWebUi](./SdxlWebUi/setup/doc/EasySdxlWebUi.webp)

EasySdxlWebUi は簡単に SDXL で画像を生成できるようにします。  

- ワンクリックインストーラーで古いパソコンでも動作する [forge 版](https://github.com/lllyasviel/stable-diffusion-webui-forge) と、実績のある [AUTOMATIC1111 版(a1111)](https://github.com/AUTOMATIC1111/stable-diffusion-webui) に両対応しており、簡単に使い始められます。
	- **forge と a1111 で多くの設定を共有しており、気軽に両方を使い分けられます。**
- 画像の生成にはインストールだけでなく、web UI の設定、拡張機能のインストールと設定、モデルなどの入手、適切なパラメータ設定などが必要になりますが、これも自動的に設定します。
	- **web UI の本体は通常の web UI と完全に同一ですので、経験が後々無駄になることもありません。**

**インストール方法は [こちら](https://github.com/Zuntan03/EasySdxlWebUi/wiki/EasySdxlWebUi-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)。**

## **[トラブルシューティング](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**

- **拡張機能の更新時にエラーが発生した場合は、`SdxlWebUi/stable-diffusion-webui(-forge)/extensions/` にある拡張機能のフォルダを削除して再更新してください。**
- **ブラウザの自動起動でまれに操作不能となる不具合があります。**  
**`SdxlWebUi-forge-DisableAutoLaunch.bat` で起動し、[http://localhost:7860/](http://localhost:7860/) をブックマークして手動で開くことで回避できます。**

## 最近の主な更新

### 2024/04/18

- **ブラウザの自動起動でまれに操作不能となる不具合があります。**  
**`SdxlWebUi-forge-DisableAutoLaunch.bat` で起動し、[http://localhost:7860/](http://localhost:7860/) をブックマークして手動で開くことで回避できます。** の注意書きを追加しました。

### 2024/04/13

- Stable Diffusion web UI 1.9.0 に更新して、画像を生成できることを確認しました。
	- 1.8.0 では使えなかった LCM 用の `LCM Karras` や Lightning 用の `* SGM Uniform` が利用できるようになりました。
	- a1111 の通常の更新手順で問題が残ってしまった場合は、`SdxlWebUi/stable-diffusion-webui/` をリネームして更新すると解決する場合があります。
	- 私の環境依存かもしれませんが、[NegPip](https://github.com/hako-mikan/sd-webui-negpip)(fp8 利用時) と [CD Tuner](https://github.com/hako-mikan/sd-webui-cd-tuner) の利用時にエラーが発生しています。
		- 機能を利用しなければ悪影響はなさそうです。
- [7th anime XL](https://huggingface.co/syaimu/7th_Layer_XL) をダウンロードする `Download/Model/7th_LayerXL.bat` を追加しました。
	- [7th anime XL-Pony A](https://civitai.com/models/395554) は Civitai でダウンロードしてください。

### 2024/04/07

- ドキュメントに『[Fixhands LoRA の重みガチャで手を修正](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Fixhands-LoRA-%E3%81%AE%E9%87%8D%E3%81%BF%E3%82%AC%E3%83%81%E3%83%A3%E3%81%A7%E6%89%8B%E3%82%92%E4%BF%AE%E6%AD%A3)』を追加しました。
	- [Fixhands LoRA](https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2) の重みガチャで手軽に手を修正する手法です。
- Easy Prompt Selector で `Fixhands` ボタンを追加しました。
- 手の描画を修正する [Fixhands LoRA](https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2) をダウンロードする `Download/Lora/Fixhands.bat` を追加しました。

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/waving-suletta.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/double_v-bocchi.webp)|
|--|--|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/rabbit_pose-aqua.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/rabbit_pose-anya.webp)|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/pointing_at_viewer-bocchi.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/FXHG/pointing_at_viewer-asuka.webp)|

### 2024/04/05

- Animagine XL 3.1 のキャラリストから、[キャラを探してコピペしやすくするスプレッドシート](https://docs.google.com/spreadsheets/d/1CA8j8PV4mZ2IYqHKrU0vKOf_YzbPcX20e6WMWUlOt64/copy)を用意しました。  
スプレッドシートをコピーしてご利用ください。
	- 作品名やキャラ名のフィルタでキャラを探して、`sex`, `name`, `series` の 3カラムをプロンプト入力欄にコピペしてください。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/AnimagineCharacterSheet.png)
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/AnimagineCharacterGen.png)
	- 元のリストから重複を取り除いてありますが、性別違いは追いきれないためそのままにしてあります。
- 不具合への仮対処として forge のバージョンを b9705c5 に巻き戻していたのを元に戻しました。

### 2024/03/31

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/AFCP/AllHW.webp)

- ドキュメントに『[Forge Couple で Animagine キャラの組み合わせ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Forge-Couple-%E3%81%A7-Animagine-%E3%82%AD%E3%83%A3%E3%83%A9%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B)』を追加しました。
	- 複数作品の Animagine 組み込みキャラを、3人以上組み合わせて画像生成できます。
- [#1](https://github.com/Zuntan03/EasySdxlWebUi/issues/1) の問題に対応しました。
	- 起動時にリロードするまで操作不能になる問題へのワークアラウンドとして `--listen` フラグを追加していましたが、これにより `extension access disabled because of command line flags` エラーが発生していました。
		- `--listen` と一緒に `--enable-insecure-extension-access` を指定するようにしました。
		- `SdxlWebUi-forge-DisableAutoLaunch.bat` で起動すれば `--listen` せずに起動できます。  
		ただし、起動時にリロードするまで操作不能になる可能性があります。
	- Civitai Helper を [butaixianran 版](https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper) に変更しました。

### 2024/03/30

- forge 版の拡張機能に [`SD Forge Attention Couple`](https://github.com/Haoming02/sd-forge-couple) を追加しました。

### 2024/03/24

- ドキュメントに『[Animagine で簡単カップリング画像生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7%E7%B0%A1%E5%8D%98%E3%82%AB%E3%83%83%E3%83%97%E3%83%AA%E3%83%B3%E3%82%B0%E7%94%BB%E5%83%8F%E7%94%9F%E6%88%90)』を追加しました。
	- [Animagine XL 3.1](https://huggingface.co/cagliostrolab/animagine-xl-3.1) で [大幅に増えた組み込みキャラ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E5%85%A8%E3%82%AD%E3%83%A3%E3%83%A9%E7%94%BB%E5%83%8F%E3%81%AE%E7%94%9F%E6%88%90) の同作品カップリング画像を、プロンプトだけで簡単に生成します。

![](https://yyy.wpx.jp/EasySdxlWebUi/ACUP/All.webp)

### 2024/03/23

- 起動時の操作不能を回避するために  --listen --autolaunch オプション付きで起動するようにしました。
	- 起動時のブラウザ表示を無効にしたい場合は、`SdxlWebUi-forge-DisableAutoLaunch.bat` を参考にしてください。
	- **更新時にエラーが発生した場合は、もう一度更新してください。**
		- 再更新で同じエラーが発生しなければ問題有りません。
- 『[Animagine 全キャラ画像の生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E5%85%A8%E3%82%AD%E3%83%A3%E3%83%A9%E7%94%BB%E5%83%8F%E3%81%AE%E7%94%9F%E6%88%90)』にアップスケール込みの立ち絵サンプル画像を追加しました。

### 2024/03/20

- ドキュメントに『[Animagine 全キャラ画像の生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E5%85%A8%E3%82%AD%E3%83%A3%E3%83%A9%E7%94%BB%E5%83%8F%E3%81%AE%E7%94%9F%E6%88%90)』を追加しました。
	- Animagine XL 3.1 がサポートしている 全 4917 キャラ の画像を生成する 10 クリック程度の手順です。  
	大量の画像の閲覧方法についても、サンプル画像付きで補足します。
	- サンプル画像は **`Download/Image/Animagine31Character.bat`** で `save/Animagine31Character/` に展開します。

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/ACHR/Prompt.png)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/ACHR/DynamicPrompt.png)|
|--|--|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/ACHR/Explorer.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/ACHR/BrowseImage.png)|

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/ACHR/Character.webp)

### 2024/03/19

- Animagine XL 3.1 の Easy Prompt Selector ボタンを追加しました。
	- 試した範囲では LCM LoRA での生成が効果的でした。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasySdxlWebUi/img/CLG/Anmg31Eps.png)

### 2024/03/18

- Animagine XL 3.1 をダウンロードする `Download/Model/animagine-xl-3.1.bat` を追加しました。
	- [公式ブログ](https://cagliostrolab.net/posts/animagine-xl-v31-release) 
	- [HuggingFace](https://huggingface.co/cagliostrolab/animagine-xl-3.1) 
	- デフォルトでインストールするモデルも Animagine XL 3.0 から 3.1 に変更しました。
- Animagine XL 3.1 のキャラクターワイルドカードを追加しました。
	- `__anmg31/char_full__` は全 4971 キャラのワイルドカードです。
	- `__anmg31/char_add__` は Animagine 3.0 に無く、3.1 で追加された 2126 キャラのワイルドカードです。
	- 『[Pony 系モデルの画風めぐり（Dynamic Prompts 組み合わせ生成）](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Pony-%E7%B3%BB%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AE%E7%94%BB%E9%A2%A8%E3%82%81%E3%81%90%E3%82%8A%EF%BC%88Dynamic-Prompts-%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E7%94%9F%E6%88%90%EF%BC%89) 』と同様の手順で全キャラの画像を生成できます。


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
- [Fixhands LoRA の重みガチャで手を修正](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Fixhands-LoRA-%E3%81%AE%E9%87%8D%E3%81%BF%E3%82%AC%E3%83%81%E3%83%A3%E3%81%A7%E6%89%8B%E3%82%92%E4%BF%AE%E6%AD%A3)
	- [Fixhands LoRA](https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2) の重みガチャで手軽に手を修正する手法です。
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
- [Animagine 全キャラ画像の生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E5%85%A8%E3%82%AD%E3%83%A3%E3%83%A9%E7%94%BB%E5%83%8F%E3%81%AE%E7%94%9F%E6%88%90)
	- Animagine XL 3.1 がサポートしている 全 4917 キャラ の画像を生成する 10 クリック程度の手順です。  
	大量の画像の閲覧方法についても、サンプル画像付きで補足します。
- [Animagine で簡単カップリング画像生成](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E3%81%A7%E7%B0%A1%E5%8D%98%E3%82%AB%E3%83%83%E3%83%97%E3%83%AA%E3%83%B3%E3%82%B0%E7%94%BB%E5%83%8F%E7%94%9F%E6%88%90)
	- [Animagine XL 3.1](https://huggingface.co/cagliostrolab/animagine-xl-3.1) で [大幅に増えた組み込みキャラ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Animagine-%E5%85%A8%E3%82%AD%E3%83%A3%E3%83%A9%E7%94%BB%E5%83%8F%E3%81%AE%E7%94%9F%E6%88%90) の同作品カップリング画像を、プロンプトだけで簡単に生成します。
- [Forge Couple で Animagine キャラの組み合わせ](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Forge-Couple-%E3%81%A7-Animagine-%E3%82%AD%E3%83%A3%E3%83%A9%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B)
	- 複数作品の Animagine 組み込みキャラを、3人以上組み合わせて画像生成できます。

### Pony Diffusion

- [Pony 系モデルの画風めぐり（Dynamic Prompts 組み合わせ生成）](https://github.com/Zuntan03/EasySdxlWebUi/wiki/Pony-%E7%B3%BB%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AE%E7%94%BB%E9%A2%A8%E3%82%81%E3%81%90%E3%82%8A%EF%BC%88Dynamic-Prompts-%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E7%94%9F%E6%88%90%EF%BC%89)
	- [PonyXL Notes](https://rentry.org/ponyxl_loras_n_stuff) で共有されている画風プロンプトを、Dynamic Prompts の組み合わせ生成で全種類一括生成します。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
