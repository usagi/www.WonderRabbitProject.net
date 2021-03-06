--
title:     9. クライアントサイドJavaScriptプログラミング入門...の為のHTMLとCSSの入門
parent:    JavaScript ⇠ Lectures
published: 2012-04-18 12:00
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0009/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 概要

この講座を受けるまで、或いは今でも
「JavaScriptと言えばウェブブラウザーで動作する簡易なスクリプト言語」
と思っていた人も多いかもしれません。
もちろんその認識は間違いではありません。
JavaScriptは元々ウェブブラウザーにおいて静的でしかなったHTMLの表現を豊かにしようと作られたものです。

言語仕様の標準化とウェブブラウザーの対応、様々なライブラリーの発達を経た今、
また、これからのHTML5時代を迎えるに当たってもJavaScriptはウェブブラウザー上での
インタラクティブな表現や優れたユーザーインターフェースの提供に欠かせないものです。

今回はそんなJavaScriptの最たる活躍の場であるウェブブラウザー上での
クライアントサイドJavaScriptプログラミングについて入門...する為に、
先ずはHTMLとCSSについて入門する事としましょう。

##### 内容

* [9.1.HTML5入門](#)
    * [9.1.1.HTMLとは何なのか？](#htmlとは何なのか)
    * [9.1.2.最も小さなHTML5文書](#最も小さなhtml5文書)
    * [9.1.3.基本的な文書構造](#基本的な文書構造)
        * [9.1.3.1.`<p>` 段落](#p-段落)
        * [9.1.3.2.`<h1>` `<h2>` `<h3>` `<h4>` `<h5>` 見出し](#h1-h2-h3-h4-h5-見出し)
        * [9.1.3.3.`<article>` 記事タグ](#article-記事タグ)
        * [9.1.3.4.`<header>` お頭タグ `<footer>` 尾びれタグ](#header-お頭タグ-footer-尾びれタグ)
        * [9.1.3.5.`<div>`と`<span>`](#divとspan)
        * [9.1.3.6.`<img>` 画像の内挿](#img-画像の内挿)
        * [9.1.3.7.HTMLマークアップの応用と発展](#htmlマークアップの応用と発展)
* [9.2.CSSとは何なのか？](#cssとは何なのか)
    * [9.2.1.文書構造と見た目の分離](#文書構造と見た目の分離)
    * [9.2.2.セレクターとか](#セレクターとか)
    * [9.2.3.プロパティとか](#プロパティとか)
    * [9.2.4.カスケーディングとは何だったのか](#カスケーディングとは何だったのか)
    * [9.2.5.HTMLとCSSのファイル分離](#htmlとcssのファイル分離)
    * [9.2.6.CSSと`@`（シナモンロール）](#cssとシナモンロール)
* [9.A.付録](#a.付録)

</nav>

## 9.1.HTML5入門

HTMLにも規格にバージョンがあります。
これからを生きる皆さんは**HTML5**だけ使えれば良いでしょう。
実は執筆時点でまだドラフトと言って、規格の制定を行なっている途中だったりはしますが、
実際にウェブブラウザーのサポートも始まって居ますし、
旧い規格よりもずっと簡単で柔軟でパワフルなのでさしあたりは**HTML5**だけ使えれば良いでしょう。

旧い規格としては、現在も多く使われている1999年に発行された[HTML 4.01](http://www.w3.org/TR/1999/REC-html401-19991224/)や、
SGMLのサブセットであったHTMLをXMLをスーパーセットとしてリメイクした[XHTML 1.1](http://www.w3.org/TR/xhtml11/)などを挙げられます。
旧い規格やHTML5の入門を超える内容については必要と興味に応じて調べて見ると良いでしょうが、
その前にこれから必要とされる規格であるHTML5をある程度使いこなせる様になった方が懸命かもしれません。

さて、それではHTMLについて、その中でJavaScriptを扱う為に必要な勉強をするとしましょう！

<div class="note">
Note: [Girls](http://Girls.demo.WonderRabbitProject.net/)のHTML構造も一応HTML5規格だったりしますよ。 :)
</div>

## 9.1.1.HTMLとは何なのか？

端的に表すと、「計算機で文書を作り、表示する為の規格」です。

昔々、まだインターネットにまだ通販サイトも有名企業のサイトも無かった頃に作られ始めた規格で、
最も簡単な計算機の文書データである「プレーンテキスト」に、
「ちょっとした約束事」を導入する事で文書内容の意図を表したり、
表示上で図や表を展開できるようにと工夫されたテキストデータの拡張の１つです。

その後何度も規格のバージョンアップを経て現在（HTML5）では、
電子書籍も表現できる程に組版や、
画像に加えて音声や映像の組み込み、
ピクセル単位のレンダリングやOpenGLによるGPU利用までサポートする
まさにHyperなテキストとなっています。

そうそう、今更ですがHTMLは"Hyper-Text-Markup-Language"の略称です。
どんなにHyperになろうとも、所詮はTextですから、
「ちょっとした約束事」を承知した人間ならばテキストエディタ１つで読み書きできるものです。

HTMLの「ちょっとした約束事」の基本がHTML-Tag（タグ）と呼ばれるルールです。

    <article>
      <h1>この記事の見出し</h1>
      <p>記事の段落その１</p>
      <p>記事の段落その２</p>
    </article>

この様に、文書構造をその意味論に基づいて抽象化した「タグ」`<article>...</article>`で囲う事で、
単なるテキストデータそれだけでは推論しなければ得られない文書構造や意図を明確にするのがHTMLです。

例えば、`<article>`は「記事」を意味し、`<h1>`はその記事の見出し、`<p>`は文書の１つの段落という
文書の構造の意味を明示する「タグ」です。
タグは**基本的には開始位置と終了位置をペアで囲んで用い**ます。
終了位置のタグは通称「閉じタグ」とも呼ばれ、タグの名前の前に`/`を書いて開始タグと区別できるようにします。

HTMLではこうして
**テキストデータのある部分が文書の中でどの様な構造関係にあって、どういった意図であるのか**
をマークアップしてハイパーな文書表現を実現するテキストのランゲージなのです。

<div class="note">
Note: Languageは言語と訳されますが、言語とはそもそもなんでしょう？意思疎通の為の約束事ですね。
人間の話す言語も、ある周波数の音声信号の変化パターンの組み合わせに言葉（＝トークン）としての意味を定義し、
その言葉を並べて言語とする事で会話や文献と言った意思疎通を実現する約束事です。
計算機のプログラミング言語やマークアップ言語も同様に考え、上手く意思疎通出来るようなりましょう！
</div>

<div class="note">
Note: 詳細についてはW3C（ウェブの標準化の元締め組織）の
HTML5の関連資料へリンクしておくので必要に応じて参考にすると良いでしょう。

- [W3C/HTML5][W3C/HTML5]
- [W3C/HTML5 differences from HTML4](http://www.w3.org/TR/2011/WD-html5-diff-20110525/)
    - [邦訳版（MITSUE-LINKS）](http://standards.mitsue.co.jp/resources/w3c/TR/html5-diff/)

</div>

## 9.1.2.最も小さなHTML5文書

さて、現実的には次のHTMLをあらゆるHTMLファイルの最初の雛形にすると良いでしょう。

- <https://gist.github.com/2405552>

   <!DOCTYPE html>
   <meta charset="utf-8">
   <title>ページ（＝このファイル）全体としてのタイトル</title>

HTMLファイルはお好みのテキストエディターで編集し、
保存時にファイルの拡張子を`.html`とすれば完成です。

この３行は通常のHTML5文書には必須です。
１行目はHTML5である事を示す記述、
２行目は文書の文字コードが`utf-8`である事を示す記述、
３行目の`<title>...</title>`はページ全体としてのタイトルをマークアップしています。

後はこの雛形に、必要な文書本体をくっつければ良いのです。
くっつける中身は次の節で代表的なものを幾つか紹介する事にして、
皆さんにはHTMLを扱う上で１つの優れたツールを紹介して措きましょう。

- [W3C Markup Validation Service](http://validator.w3.org/#validate_by_input)

これからHTMLを書くに当たってはこのオンラインサービスで随時チェックする事を心掛けましょう。
特定のウェブブラウザで動作するか否かよりも、先ずはこのValidater（規格準拠のチェックツール）で
エラーが出ない事を確認する様にしましょう。さっそく上記の最小限の雛形をチェックして見ると良いでしょう。
このValidatorは３つのモード、
①特定のURLをチェックするモード、
②HTMLファイルをアップロードしてチェックするモード、
③直接HTMLのソースコードを書いて（貼り付けて）チェックするモー
で使用できます。

FirefoxのアドオンやChromeのプラグインとして、

- Firefox [Html Validator](https://addons.mozilla.jp/firefox/details/249)
- Chrome [W3C HTML5 & CSS3 Validator](https://chrome.google.com/webstore/detail/kobpbiokkobnmnaefmpcodeeficgbfkg?hl=ja)

なんてものもありますので便利に使うと良いでしょう。

## 9.1.3.基本的な文書構造

さて、先の３行の雛形に何かくっつけて文書を構築してみましょう。
最も簡単には、４行目から何もタグを使わずにただテキストデータで本文を書く事もできますが、

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>ページ（＝このファイル）全体としてのタイトル</title>
    はらほろひれはれ

これではタイトルを文字コードを指定できるだけのプレーンテキストですから、普通こういう事はやりません。
しかし、HTMLの最小限の構成と実際の解釈を解説し始めるには適当な例でしょう。
上記の例は実際には次の様に解釈されます。

    <!DOCTYPE html>
    <head>
      <meta charset="utf-8">
      <title>ページ（＝このファイル）全体としてのタイトル</title>
    </head>
    <body>
      はらほろひれはれ
    </body>

実際にはインデントまで勝手にされる事はありませんが、今回は見やすさの為にインデントして示しました。
`<head>`は文書に付随する各種情報を定義する領域、`<body>`は文書本体を定義する領域を示します。
HTML5ではこれら記述が冗長なだけのタグは通常省略しても、ウェブブラウザーは正しくHTMLを解釈してくれます。
以降も`<head>`と`<body>`は省略したまま進めますが、もちろん手作業で記述してもエラーにはなりません。

### 9.1.3.1.`<p>` 段落

HTMLでマークアップするならば、

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>ページ（＝このファイル）全体としてのタイトル</title>
    <p>昔々、あるところに、おじいさんとおばあ（ｒｙ
    <p>おじいさんが川で洗濯をしていると（ｒｙ
    <p>おばあさんは山で光る竹を（ｒｙ

文書は最低限`<p>`（Paragraph: 段落）タグで段落を付けると良いでしょう。

さて、気付いた人も居ると思うのですが、`<p>`に対応する閉じタグ`</p>`を書いていません。
これは先生がうっかり書き忘れたからではなく、
閉じタグを省略できるという仕様がある為に書かなったのです。

この様に一部のHTMLタグは仕様で閉じタグを省略しても良い事が明記されています。
...されているのですが、慣れないうちは基本的に全てのタグに閉じタグを書いてしまうのが間違いありません。
JavaScriptのダックタイピング機能然り、この様な省略表記はある程度修行を詰んだ玄人で無ければ上手く使い熟せずに、
寧ろバグを埋め込んでしまう原因となります。
何を省略できるのかしっかりと覚えられないうちは、省略しないか、
或いはValidatorでしっかりチェックする癖を付ける様にすると良いでしょう。

### 9.1.3.2.`<h1>` `<h2>` `<h3>` `<h4>` `<h5>` 見出し

さてさて、多くの文書には段落だけではなく、見出しがありますね？
小説でも第一章だとか第一話だとか区切ったりしますし、
新聞の記事１つ１つにも見出しがあります。

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>ページ（＝このファイル）全体としてのタイトル</title>
    <h1>御伽話</h1>
    <p>昔々、あるところに、おじいさんとおばあ（ｒｙ
    <p>おじいさんが川で洗濯をしていると（ｒｙ
    <p>おばあさんは山で光る竹を（ｒｙ

先程までの文書に`<h1>`（Heading: 見出し）で見出しを付けてみました。
Headingには`h1`の他にも`h2` `h3` `h4` `h5`などの見出しレベルの違いに応じたタグが用意されています。
例えば、１つの文章の中で「第１章」の中に「第１節」がある場合には、それぞれを`h1`と`h2`で見出し付けすると良いでしょう。

...さて、この辺りでちょっと横道にそれますが、そろそろ、Validatorだけでは無く、
実際のウェブブラウザーでも表示を確認しながら学習したくなっていると思います。

1. Firefoxなら[Firebug](https://addons.mozilla.org/ja/firefox/addon/firebug/)というアドオンを導入しましょう。
1. そして、お試し表示中のHTMLファイルを表示している状態で、F12を押して見ましょう。
1. それからなにやらHTMLソースが表示されているところで、
`<body...`の辺りで右クリックして`Edit as HTML`（HTMLを編集）とします。

すると、HTMLをオンライン（表示したままその場で）で編集できる様になります。
適当なページを表示してごちゃごちゃしていた状態なら、全て選択してまっさらに削除して、
それから自分がウェブブラウザーでテストしたいHTMLソースを実際にそこに書いてみましょう。
この機能を使うと、HTMLソースを書きながら本物のウェブブラウザーでの表示をリアルタイムに確認できます。

Chromeでも似たことは出来ます。プラグインは不要で、同様にF12で類似機能を作動できますが、
オンライン編集性についてはFirebugの方が使い易いかもしれません。

![figure-9.1.3.2.-1](images/firebug-1.png)

便利ですねー・ｗ・ｂ

### 9.1.3.3.`<article>` 記事タグ

１つのページに複数の記事を入れたい事もありますね？
例えば新聞の１ページには沢山の記事があって、それぞれに見出しや複数の段落があります。
HTMLでは記事１つを`<article>`で構築します。

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>御伽日報</title>
    <article>
      <h1>竹取翁、遂に月へ</h1>
      <p>竹取翁（１１０４）が種子島宇宙センターでの宇宙飛行訓練を終え、遂に月へと（ｒｙ
    </article>
    <article>
      <h1>ニャルラトホテプ星の探索、始まる<h1>
      <p>NASAはニャルラトホテプ星の探索を始めた事を現地時間昨晩の定例記者会見で発表し（ｒｙ
      <h2>日本政府の対応</h2>
      <p>（」・ω・）」うー！（／・ω・）／にゃー！
    </article>
    
とかまあこんな感じで複数の記事（＝`<article>`）を１つのページに入れる事もできます。

なお、HTMLでは連続したスペースやタブをインデントとして使用できます。
文書構造が複雑になるほどタグだらけで読み難くなりますから、できだけ分り易いインデントを心掛けましょう。

<div class="note">
Note: HTMLでインデントや改行をすると表示がずれる事があります。
もしもそうした問題に直面した場合は少々面倒になりますがXHTML5という方式で.xhtmlとするか、
改行を含めたホワイトスペース文字群をHTMLタグのコメントアウト（`<!--ブロックコメント-->`）でHTML解釈から外してしまうか、
ぴったり表示させたい要素は後に説明するCSSを上手く用いるか、
読み書き用の他にデプロイ用のホワイトスペースを除去したHTMLを生成するツールを用意するか、
そういった解決方法を取る必要が生じるかもしれません。困ったらとりあえず先生に相談してみて下さい。
</div>

### 9.1.3.4.`<header>` お頭タグ `<footer>` 尾びれタグ

一般に文書の構造には、本文の他にヘッダー、フッターと呼ばれる部分があります。
実際の例を示しましょう: 

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>八女茶 - 日本の緑茶こばなし</title>
    <header>
      <h1>日本の緑茶こばなし</h1>
      <p>日本の緑茶についてのこばなしを勝手に語るウェブサイトにござるＵ・ｘ・Ｕ</p>
    </header>
    <article>
      <header>
        <h1>八女茶</h1>
      </header>
      <p>八女茶は日本の福岡の八女市周辺で作られる茶の総称。
      <p>中でも八女市に合併した旧・星野村で作られる伝統製法の玉露は
         八女星野村というブランドで日本の茶人に広く愛される日本を代表する玉露である。
    </article>
    <footer>
      <p>©2012 ティ・ヴェール Allrights reserved.
    </footer>

ページ全体としての`<header>`（header: お頭）と`<footer>`（footer: 尾びれ）がマークアップされ、
さらに`<article>`の中でも`<h1>`を`<header>`に入れています。

この様に、`<header>`と`<footer>`は文書全体か、
或いは`<article>`内部でのヘッダーとフッターの意図をマークアップする為に用います。

<div class="note">
Note: 焼き魚やお刺身のお頭と尾びれのイメージで解説したが、
一般に「お頭タグ」とか「尾びれタグ」と言っても通じないので、
その意図はどんなものかという解説の為に用語を用いてる点には注意して下さい。
</div>

### 9.1.3.5.`div`と`span`

この後でCSSについても学習を進めると、
「**文書構造として**の意味は特に強く無いのだが**文書中のある一部分**についてどうこうしたい」
という要求が発生する事でしょう。

`<p>`タグとほぼ同等だけど文書構造としての意味は無いタグが`<div>`、
もっと小さな単位である段落の中の文字列の一部分を囲みたい場合のタグが`<span>`です。

ヴィジュアル表現に凝る必要がある場合には、
HTMLソースに大量の`<div>`や`<span>`を埋め込む事になるでしょう。

ご利用は計画的に・ｘ・

### 9.1.3.6.`<img>` 画像の内挿

    <img src="cat.svg" alt="特に意味はないが猫のイラストをどうぞ">

とかやると画像を内挿できます。

`src`には".png"、".jpeg|jpg"、".gif"などのラスター画像形式の他、
ベクター画像形式の".svg"を指示する事もできます。

`alt`には画像の説明を文書で入れます。
この属性は必須ですので、入れ忘れない様に注意しましょう。
画像にマウスオーバーした際や、画像を表示できなかった際の代替として使われます。

↓ここにHTML5のロゴ画像が表示されているでしょうか？
SVG形式のベクター画像を内挿してみました。


<a href="http://www.w3.org/html/logo/">![figure-9.1.3.6.-1](http://www.w3.org/html/logo/downloads/HTML5_Logo.svg)</a>

↑ここにHTML5のロゴ画像が表示されていない？
最新のFirefoxかChromeかOperaを使っていれば表示されると思うのですが、どうした事でしょうね・ｗ・

### 9.1.3.7.HTMLマークアップの応用と発展

ここまでに紹介したHTMLタグはほんの一部に過ぎません。
HTMLタグのリファレンスは日本語でも幾つかの便利な情報サイトがあります。

- [HTML クイックリファレンス](http://www.htmq.com/)
- [TAG&lt;index&gt;](http://www.tagindex.com/)

また、HTML5に特化したマークアップ情報サイトもあります。

- [HTML5.JP](http://www.html5.jp/)
    - [HTML5 チュートリアル](http://www.html5.jp/tutorial/)
        - [html5doctor](http://www.html5.jp/html5doctor/)

特に「HTML5 チュートリアル」やその中でも「html5doctor」から見始めると良いでしょう。

基本的には上記の日本語情報サイトと、初めに紹介した[W3CのHTML5ドラフト][W3C/HTML5]を参照しながら、
自分が作ろうとする案件に必要なものから、或いは興味のあるタグから学習を始めれば良いでしょう。

<div class="note">
Note: こうした基礎的な部分から学び始めたばかりのHTMLの初学者にとって、
香ばしいタグとして`<video>` `<audio>` `<canvas>`などのHTML5の魅力的なタグたちは
気になって仕方がないかもしれません。もちろんそれらを今すぐに調べて使い始める事を止めはしませんが、
HTMLは文書構造を意味論から表現する為の仕組みですから、先ずは`<article>`はじめ、
文書構造を整理する為のタグを使いこなせる様になる事がおろそかにならないように注意しましょう・ｘ・
</div>

## 9.2.CSSとは何なのか？

さて、HTMLの文書構造については前節で基本は扱える様になった事でしょう。
しかし、実際の処HTMLをマークアップする際には文書の意味論に基づいたHTMLそれ自体のマークアップだけでは無く、
ヴィジュアルデザインも行いたいですね？
HTMLは文書の意味論を記述するものなので、
見た目についてはウェブブラウザーがタグで意味論を明示された要素ごとにデフォルトのデザインを適用する事しか期待できません。

そこで、HTMLの最終的なレンダリング、つまりエンドユーザーの表示上の見た目もプログラマブルにする為の仕様がCSSです。
CSSの最新バージョンはCSS3として現在策定中です。
既にウェブブラウザーでは実装、或いは試験的な対応がされていますので、積極的に使ってみて学習を進めると良いでしょう。
皆さんが学生を終わる頃には、世の中では既にHTML5もCSS3も積極的に実用されている事でしょうし。

CSS3の仕様について正式な文書は下記を参照すると良いでしょう。
CSS3からは定義がモジュールと呼ばれる単位で分割されている事に注意してください。

- [W3C / CSS TR](http://www.w3.org/TR/#tr_CSS)
    - 仕様完成モジュール
        - [CSS3 Selector] (http://www.w3.org/TR/2011/REC-css3-selectors-20110929/)
        - [CSS3 Color] (http://www.w3.org/TR/2011/REC-css3-color-20110607/)
    - ほか仕様策定中モジュール多数（リンク先の"Drafts"を参照）

ちなみに、CSSは"Cascading Style Sheet"の略称です。
「カスケーディング」の部分は後で説明します。
「スタイルシート」はHTMLを可視化する際に使う型紙の様なものを表しています。
次節から早速そのスタイルシートの定義方法について学びましょう！

### 9.2.1.文書構造と見た目の分離

さて、文書構造をその文書の各要素ごとの意味論から定義するのがHTMLの役割、
見た目についてはCSSの役割だと説明しました。
では、実際にどの様にしてCSSを適用するのか紹介します: 

    <h1 style="font-size:25px;color:red;">ヘッディング</h1>
    <p style="color:#12F">パラグラフ

最も安直なCSSの設定方法です。HTMLタグに`style`属性というものを追加で定義して、
その値としてCSSとして定義された見た目の設定を定義するという方法です。

この例では特定のh1タグのフォントサイズを25px、前景色を赤に、
また特定のpタグの前景色を#12F（#RGB、各4階調16進数表記）に見た目を設定しています。

しかし、これでは只でさえ複雑になると読み難いHTMLのソースコードが、さらに混沌としてしまいます。
それに、１つ１つのタグ全てにCSSの設定を施さなければならないとしたら、プログラマビリティが低すぎて面倒ですね。

そこで、CSSは通常「セレクター」と呼ばれる方法を用いて、
HTMLタグ直接ではなく、その「セレクター」という方法を通して記述します。

### 9.2.2.セレクターとか

さっそくHTMLタグ直接ではない方法でCSSを使う例を見てみましょう: 

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>もけもけ</title>
    <style>
      h1 {
        font-size : 25px;
        color     : red;
      }
      
      p {
        color: #12F;
      }
    </style>
    <h1>ヘッディング</h1>
    <p>パラグラフ</p>

今回は敢えて本文の上の部分もきちんと書きました。
この様に、本文が始まる前に`<style>`というCSS定義用の特別のタグを使い、
その中でCSSを定義する事ができます。

ここで、

      h1 {
        font-size : 25px;
        color     : red;
      }

この`h1`の部分をCSSの「セレクター」と呼びます。次の、

      p {
        color: #12F;
      }

`p`の部分も同様にCSSのセレクターです。

セレクターはそれに続くCSSの定義本体を何に対して適用するのか、
その選択を行う仕組みです。

上記の例の`h1`や`p`の様にタグの名称をセレクターとした場合は、
そのタグ全てに対して有効なCSSを定義します。

タグを直接指定する方法の他には、

    .abc { ... }
    #def { ... }
    * { ... }
    a:hover { ... }

などのセレクターの定義方法があり、それぞれ
`.abc`はHTMLタグに持たせる事のできる「クラス」、
`#def`はHTMLタグに持たせる事のできる「id」、
`*`は総称セレクターと言って「全てのHTML要素」、
`a:hover`は擬似クラスセレクターの１つで「`a`タグが`hover`（＝マウスオーバー）されたとき」と言う複合的な条件指定です。

ここで、HTMLタグのクラスとは、次の様にHTMLタグの内部で任意に複数を重複して定義できる分類の為の情報です: 

    <article class="aaa bbb ccc"> ... </article>
    <article class="aaa ccc" ... </article>

この様に、HTMLタグの内部に`class`という属性を定義できます。
１つ目のarticleタグは`aaa` `bbb` `ccc`なる３つのクラスに属し、
２つ目のarticleタグは`aaa` `ccc`なる２つのクラスに属しているという定義になります。
この時、`.aaa { ... }`というCSS定義があれば両方のarticleタグに有効ですし、
`.bbb { ... }`というCSS定義があれば１つ目のartcileタグにのみ有効となります。
全てのタグでは広すぎる場合にクラスを用いて特定のクラスを持っているタグにだけCSSを適用する場合に便利です。

次に、HTMLタグのidとは、

    <article id="alpha"> ... </article>
    <article id="beta"> ... </article>

この様に、HTMLタグの内部に`id`という属性を定義して用いるものです。
クラスと異なり、idはHTMLの仕様により重複が許されません。
よって、idを指定してのCSS定義では、ページの中で特定のたった１つの要素だけに的を絞りたい場合に便利です。

また、擬似クラスセレクターは`:hover`だけではありませんし、
`a:hover`ではなく`article:hover`でも`.aaa:hover`でも`*:hover`でも構いません。

擬似クラスセレクターには`hover`の様な比較的扱い易いものから、
やや複雑なものまで多数の定義があります。

簡易的な情報源としては、

- [symple - CSS3の可能性と実践【擬似クラス編】](http://symple.jp/90.html)

などを参考にすると良いでしょう。
また、本質的な情報源としては、CSS3セレクターの仕様書を参照しましょう: 

- [W3C/Selectors Level 3](http://www.w3.org/TR/selectors/)
    - [6.6. Pseudo-classes](http://www.w3.org/TR/selectors/#pseudo-classes) (擬似クラス)

ある程度、どの様な擬似クラスセレクターが定義できるのか目を通して措くと、
UIの実装が楽に、或いは企画段階でも面白い動きを想定できるかもしれませんね。

さらに、タグの名称とクラスを組み合わせて`h1.aaa`（＝h1タグかつクラスaaaに属する要素）とか、
`h1.aaa:hover`（＝h1タグかつクラスaaaに属しかつマウスオーバー中の要素）なんて事もできますし、
要素間の親子関係を`article.aaa p`（＝articleタグかつクラスaaaに属する親要素を持つp要素）とか、
`header > h1`（＝headerタグ直下のh1要素）の様な指定、
他にもアレコレととても柔軟に指定できるようになっています。
一気に学習するには多すぎるので、徐々に便利そうなもの、
実用上必要になったものを中心に少しずつ学習すると良いでしょう！

<div class="note">
Note: 擬似クラスとやや似たもので「擬似要素」というものもCSS仕様に定義があります。
これはHTMLには元々存在しない要素をCSSだけで仮想的に要素をつくり上げる機能です。
CSSに慣れてきたと感じた頃に学習してみると良いでしょう。例えば`:after`とかね。
</div>

### 9.2.3.プロパティとか

さて、CSSを適用する対象の選び方についてはセレクターを紹介しました。
では、実際に適用する見た目の定義はどの様にするか、それがCSSの「プロパティ」です。

      h1 {
        font-size : 25px;
        color     : red;
      }

この例では、`h1`タグに対して、

1. font-size: 25px;
2. color:red;

と言う２つのCSS定義を行なっています。
CSSの定義本体はセレクターに続く`{ ... }`の内部に記述し、
`;`を定義の末尾に付けて、複数の定義の区切りとします。
この定義の１つ１つをCSSのプロパティと言います。

例えば
「h1セレクターのfont-sizeプロパティの値は25pxと定義されています」
と言う具合に。

CSSのプロパティはセレクターよりもさらに多くの種類が仕様に定義されています。
つまりセレクター以上に片っ端から覚える様なやり方で学習する事は難しいでしょう。
そこでお勧めの学習方法は、自分が真似をしたくなる様なお気に入りのヴィジュアルデザインのウェブサイトを訪れて、
そこでF12キー（FirefoxのfirebugやChromeでは）を押し、お気に入りのデザインのCSSがどの様になっているのかを学ぶのです。

そうしてプロパティとその設定例の実用例を興味のあるものから学んだならば、
CSSの言語仕様書を読めればそれで良いですし、日本語の解説サイトでそのプロパティについての情報を確認するなどして、
少しずつCSSのプロパティ全体に対して学習すると良いでしょう。

- [HTML クイックリファレンス/CSS3](http://www.htmq.com/css3/)

とは言え、どのようなプロパティがあるのか全く知らない状態からでは探索も難しいかもしれません。
以下に幾つか良く使われる、或いは特に知っておくと良いかもしれないCSSのプロパティを挙げて措くので、
興味を持ったものから調べて学習の取っ掛かりにすると良いでしょう。

- 位置に関わるもの
    - margin : 対象要素が周囲の他の要素からどれくらい隙間を空けて配置されるか
    - padding : 対象要素が中身の外側にどれくらい余裕を持たせた大きさとなるか
    - position : 対象要素の表示位置の基準をどの様に決めるか
    - left, top, right, bottom : 対象要素を表示する位置の具体的な指定
    - align : 対象要素の中身を左右或いは中央に寄せるか
    - z-index : 奥行き方向の表示（重なり）の優先度を指定
    - float, clear : 回り込み表示の指定
- 変形に関わるもの
    - width, height : 対象要素の横幅と高さを指定
    - transform : 対象要素を回転させたり
- 装飾に関わるもの
    - text-decoration : 下線を引いたり、打ち消し線を引いたり
    - text-shadow : 対象要素内の文字に影を付ける
    - border : 対象要素の周囲に枠を付ける
    - border-radius : 対象要素の四隅を丸くクリッピングする（いわゆる角丸化）
    - box-shadow : 対象要素に影を付ける
    - background : 背景の色や画像、繰り返しパターンなどを指定
- 文字に関わるもの
    - font : フォントの大きさ、太さ、種類などを指定
    - color : 前景色を指定
    - line-height : 行の高さを指定
- 列挙に関わるもの
    - list-style : リストの表示に使われる記号や数字などのマーカーを指定
- その他
    - display : 対象要素の表示方法を指定

なお、同じプロパティを複数のセレクターを対象に指定したい場合は次の文法を使うと少しは楽かもしれません: 

    article.classA,
    article.classB{
      ...
    }

複数のセレクターを`,`で区切って、同じ定義を適用させる文法です。

<div class="note">
Note: CSSのプロパティの定義群の一番最後のプロパティの後の`;`は省略可能、
というよりこの`;`はプログラム言語の`for(;;)`文における`;`と同様に単なるセパレーターなので、
末尾のプロパティの定義の後には本来必要無いのです。
...ですが、それ以外の場所での`;`の付け忘れによるバグに繋がり易いので、
特に理由が無ければ基本的に全てのCSSプロパティの末尾に`;`を記述した方が良いでしょう。
1バイトすら転送量を削りたい！という場合には、
自動的に省略可能な部分を省略してくれるツールとかを使ってからデプロイするとか、
そういった方法もありますからね・ｘ・
</div>

### 9.2.4.カスケーディングとは何だったのか

CSSの説明の初めの辺りで、「カスケーディング」については後で説明しますと言いました。
この「カスケーディング」は直訳で「滝が多段に連続している様な」と言う感じの表現です。

CSSの定義方法によっては、ある要素へ同じプロパティの設定が複数重複して定義される事があります。
例えば、

    .abc { font-size: 20px; color: red; }
    .def { background-color: green; }
    #ghi { color: blue; }

この様なCSS定義があったとき、次のHTML要素に適用される最終的なCSSはどの様な内容になるでしょう？

    <h1 id="ghi" class="abc def">

答えは次の通り: 

    {
      font-size: 20px;
      background-color: green;
      color: blue;
    }

CSSでは、競合しないプロパティは全て合体します。
`.abc`と`#ghi`の`color`の様に競合するプロパティは、
より具体的に対象を絞り込んでいるセレクターの値が優先されます。
優先度が同じものが複数あれば、より後で読み込まれたプロパティが優先されます。

基本的な優先度: `*` < `.abc` < `#abc` < `HTMLタグに直接書いたstyle属性`

<div class="note">
Note: 厳密には擬似クラスや擬似要素と
</div>

### 9.2.5.HTMLとCSSのファイル分離

HTMLとCSSの学習用としては１つのファイルの中で両方を試せるのも都合が良いかもしれませんが、
一般的にはCSSをHTMLファイルから分離して別のファイルとします: 

    <!DOCTYPE html>
    <meta charset="utf-8">
    <title>ページのタイトル</title>
    <link rel="stylesheet" href="main.css">
    <h1>ヘッディング</h1>
    <p>パラグラフ

HTMLではこの様に`<style>`タグに代えて`<link>`タグを本文が始まる前に入れ、
`rel`属性でスタイルシートへのリンクである事を指示し、
`href`属性でCSSを定義したファイル(例えば"main.css")へのパスを指示します。

".css"ファイルの中身は、

    h1 { ... }
    p { ... }

の様に、直接CSSの定義を書きます。

また、HTMLに複数の`<link>`タグを並べて書いて、
複数のCSSファイルを１つのHTMLに読み込ませる事もできます。

### 9.2.6.CSSと`@`（シナモンロール）

CSSには`@`で始まる文法が幾つか存在します。
例えば`@media ... { ... }`や`@import ...`など。

今回はボリュー的な都合解説を省略します。
これらはCSSの基本的な使い方に慣れた後で必要に応じて触れると良いでしょう。

<div class="note">
Note: これら`@`で始まる文法は、複雑だったり規模の大きなCSSを扱ったり、
表示デバイスに応じてCSSを切り替えたりする際に用いるものです。
</div>

## 9.A.付録

[prev]: ../0008/
[next]: ../0010/

[gist]:   http://gist.github.com/
[ideone]: http://www.ideone.com/

[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm
[W3C/HTML5]: http://www.w3.org/TR/html5/

