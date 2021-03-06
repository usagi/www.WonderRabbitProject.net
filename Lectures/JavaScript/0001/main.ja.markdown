--
parent:    JavaScript ⇠ Lectures
title:     1. JavaScriptで楽しみましょう
published: 2012-03-28 23:30
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0001/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 内容

* [1.1.はじめの環境整備](#はじめの環境整備)
* [1.2.電卓とJavaScriptの式と関数の考え方](#電卓とJavaScriptの式と関数の考え方)
* [1.3.変数を使って少しプログラムらしい事をしてみる](#変数を使って少しプログラムらしい事をしてみる)
* [1.4.関数も使えたなら、もうプログラムらしいものも作れるね](#関数も使えたなら、もうプログラムらしいものも作れるね)
* [1.5.プログラムをファイルに保存して実行してみよう](#プログラムをファイルに保存して実行してみよう)
* [1.A.付録](#a.付録)
    * [1.A.1.○○についてもう一度！](#a.1.○○についてもう一度！)
    * [1.A.2.お勧めのテキストエディタを教えて下さい](#a.2.お勧めのテキストエディタを教えて下さい)
    * [1.A.3.Windowsとcmdでの実行例](#a.3.windowsとcmdでの実行例)

</nav>

## 1.1. 環境整備

さっそくですが、
[Node.js][Node.js]
をダウンロードして導入（インストール）しましょう。

* [Node.js][Node.js]

[Node.js][Node.js]は柔軟でパワフルな
JavaScript処理系（内部的に[V8][V8]を使用）の１つで、
使い勝手の良い便利なJavaScriptの環境（ライブラリ管理を省力化できるnpmとか）
一式が簡単に整います。ちなみに、JavaScriptと言うのは、
現在では[ECMA-262][ECMA-262]により言語仕様が標準化され、
ウェブブラウザーの組み込みスクリプト機能や、FLASHのActionScript、
そしてNode.jsなどの具体的な処理系はこの仕様に基づいて実装される様になっています。

[ToDo:ここにJavaScriptの仲間たちの絵を挿入する]

[Node.js]:  http://nodejs.org/
[V8]:       http://code.google.com/p/v8/
[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm
[ECMA]:     http://www.ecma-international.org/

## 1.2.電卓とJavaScriptの式と関数の考え方

さて、Node.jsの準備は（たぶん）できたかな？
使える状態になっているか、早速試してみよう。

端末（Windowsでは「コマンドプロンプト」と呼ばれる事が多いよ）を起動して、
`node`コマンドを実行してみよう。

    (YOUR-PC PROMPT %) node
    > 

<div class="note">
Note: Windowsで端末を起動する最も手っ取り早い方法は「Win+R→cmd⏎」、
NT6では「Win→cmd」でも検索機能を経て起動できる。
</div>

<div class="note">
Note: 現在のWindowsはWindows NT系のOSであり、
NT6は6.2(Windows 8)、6.1(Window 7)、6.0(Windows Vista)など6.x系の総称。
メジャーバージョンが同一であればほぼ同じOSカーネルを使っていると思って構わない。
ちなみにWindows XPはNT5.1、Windows 2000はNT5.0。
</div>

<div class="note">
Note: UNIX系OS（Mac OS X、Linuxなど）ではttyでも端末エミュレーターでも構わないし、
シェルもbashでもzshでもshでも何を使っても構わない。Windows系ではcmd.exeの他に、
PowerShellやSUAやmingwやcygwinという選択肢を使っても構わないが、
たぶん面倒だったり重かったりするのでお勧めしない。
</div>

無事に`node`コマンドは実行できたかな？
行の初めに入力を受け付ける鳥さんが居てカーソルが点滅していれば、
きっとNode.jsのインタープリターの起動に成功している。

不幸にも起動できていない様な気がする場合には、とりあえずログオフ＆ログインしてみよう。
それで使えるようになったなら「パス」の設定の適用が必要だっただけだろう。
問題が他にありそうな場合は、素直に先生に相談する事。

おめでとう！（だと嬉しい）

さて、それでは早速JavaScriptのプログラムを実行してみようか。
Node.jsのインタープリターへ次の様な「式」を入力してみよう:

    > 1 + 1
    2

またまたおめでとう！入力した式の計算結果が得られたね。
これは君が入力した「式」
（ただの算数の式だが、実はこれはJavaScriptの「式」でもある！）
をJavaScriptの処理系、つまりここではNode.js（厳密に言えばその中のV8）が
「評価」し、その「式」の評価結果を表示してくれたんだ。

さあ、もっと色々と計算させてみよう:

    > 1 + 2 + 3
    6
    > 4 * 5 / 6
    3.3333333333333335
    > 10 % 3
    1

これは良い電卓を手に入れたね！^^

でも、実はこれ電卓なんかじゃないんだ…、
**プログラミング言語JavaScript**だったんだ！！

<div class="note">
Note: 読者はここで『Ω ΩΩ ﾅ ﾅﾝﾀﾞｯﾃｰ!!』と反応する事。
</div>

まあ、そういう訳なので、このNode.jsのインタープリターでは
「変数」とか「関数」とか、あと「プロトタイプ」とか使って
プログラミングする事ができます。

## 1.3.変数を使って少しプログラムらしい事をしてみる

さて、そんな訳でただの電卓からプログラムらしい何かをする為の第一歩として、
プログラミングの基礎部品の１つである**「変数」**を使ってみよう

こんな感じで:

    > var a = 1
    undefined
    > a
    1
    > a + 1
    2
    > a = a * 3 + 2
    5
    > a + 1
    6

`var`というのは言語組み込みの特別なキーワードの１つで、
その「効果」は「ローカル変数を宣言する」だよ。

<div class="note">
Note: 「**undefined**とか出てるけど大丈夫なんですかこれ？」と聞きたいかもしれない。
**『大丈夫だ。問題ない。』**…とりあえず今のところはね。
後でちゃんと説明するから安心して先へ進むといいよ。
</div>

そうそう、おめでとう！！

と、言い忘れていたよ。これでもう君は**ローカル変数**をマスターしたね！^^

<div class="note">
Note: ここではまだ「ローカル」の意味は知らなくても大丈夫だよ。
少なくともこれで「ローカル変数」については使えるはずだしね。
</div>

<div class="note">
Note: 例では何気なく宣言済みの`a`に何度も「代入」を行なっていますが、
これはプログラミングでは一般に「破壊的代入」と呼ばれる操作を行なっています。
何が「破壊的」なのかと言うと、代入の前後で`a`の中身が変わってしまっています。
もし、プログラムの中のどこかあちらこちらで、
この`a`の中に入れてある「もの」を使っていたとしたら、
それらは`a`が「変数」であるからプログラムの実行中のある時とまた別のある時とでは
中身が変わってしまう可能性がある事にしっかりと注意して扱う必要があります。
「そんなの当然じゃない？だって変数ですもの・ｘ・；」、
世の中には「破壊的代入」を言語仕様に持たない
「純粋」なプログラミング言語もあるんですよ！
ちなみに`var a = 1`は「破壊的代入」でしょうか？考えてみて下さい^^
</div>

## 1.4.関数も使えたなら、もうプログラムらしいものも作れるね

さて、それでは流れ的に他にももう１つ、
プログラミングの基本部品である**「関数」**を試してみようか:

    > function(x){ return x + 1; }(0)
    1

一応これで「関数」を定義して、
それと（ほぼ）同時にその「関数」に「パラメーター」を与えて「評価」させているよ。
実際のところ、「関数」の定義だけなら次の部分だけで出来ているんだ。

    > function(x){ return x + 1; }
    [Function]

「これを評価したら`[Function]`だったよ！」とNode.jsのインタープリターがその評価結果を教えてくれたね。

さて、ここで問題が１つ。
「関数」はプログラムの一部を部品として小分けに作って置いて、
それを必要な時に必要なところで必要なだけ呼び付けて使う為の機能…
なんだけど、これじゃ使う度に関数を作らなくちゃならなくて、
なんだか妙な気もするよね？

そこで次の様にして定義した「関数」は、普通は「変数」に入れて置いて、
それで必要に応じて使うんだ:

    > var f = function(a){ return a + 1;}
    undefined
    > f
    [Function]
    > f(3)
    4

んー、ここでも`undefined`の心配は例によってまだ必要無いよ！
実際に、君は「関数」を定義して、それを変数に放り込んで置いて、
それからその放り込んで置いた**「定義しておいた関数ってもの」**を呼び付ける事が出来ているしね。

JavaScriptでは、電卓として遊んだ「数値ってもの」も「関数ってもの」も、
定義して「もの」になってしまえば「変数」に入れられるし、
定義して存在さえしていればその場で「評価」して使う事もできるんだ。

<div class="note">
Note: これは関数型言語というプログラミング言語の特徴を強く醸し出している部分。
関数型言語は文字通り関数をその言語の世界の中心として位置付けて扱える言語。
JavaScriptの他にはHaskell、F#、OCaml、Schemeなどがこの言語の仲間たちです。
</div>

ちなみに、`function`はこれから「関数」だよって言語組み込みのキーワード、
それに続く(a)は呼び付ける時には
１つのパラメーター（関数に「コレ」やって！と頼む時の「コレ」）を
受け取ってそれを関数の中ではaという名前の変数として扱い、
関数の本体（＝中身、やる内容）は`{`と`}`に囲んだ部分。

今回は関数の本体として、`return a + 1;`と１つだけの
「ステートメント」（＝文、プログラムの小さな１つの単位）を定義しているね。
`return a + 1;`は`a + 1`をこの関数の評価結果として定義して呼び出し元に処理を戻すステートメントだよ。

ちなみに、returnステートメントの最後にくっつけた`;`は、
「ステートメントはここまでですよ」と言う印で、
プログラムが複数のステートメントを伴う場合の区切り記号としての言語組み込みのキーワードなんだ。
プログラムの内容がたった１つのステートメントで終わるって事は殆ど無いから、
これからすっかりお世話になって、付け忘れると処理系が上手くステートメントの区切りを解釈できずに、
プログラムが「バグ」ってしまう事になるから気をつけてね・ｗ・；

<div class="note">
Note: あ、言うのが遅れたけど、JavaScriptとJavaは冗談抜きに親戚でも何でもないんだ。
言語としての特徴付けすらまるで別ものだから、くれぐれも名前が似てるからって
頭の中で混ざらない様に十分に注意して学習を進めて下さいね・ｘ・；
</div>

おめでとう！！これで君は**「関数」**もマスターできた・・・ね^^ たぶんだけどね^^

## 1.5.プログラムをファイルに保存して実行してみよう

さて、最後に、プログラムをインタープリターでちまちま実行するんじゃなく、
テキストエディターでごりごり書いて、それをファイルに保存したものを実行する方法を紹介するよ！

試しに、ソースコードをお気に入りのテキストエディターで書いて、
それからそれを".js"って拡張子を付けて保存しよう:

[your-source.js]

    var n = 0;
    var f = function(){ console.log("Hello, JavaScript! " ++ ++n); };
    f();
    f(); f();
    f(); f(); f();

さっきまではインタープリターを使っていたから、
「ここでこの内容を画面に出して！」とプログラムを書かなくても、
いちいち入力した内容全体を「評価」した結果を自動的に表示してくれていたんだけど、
通常プログラムがそんな挙動をしていたら画面が溢れかえってしまうし不必要な処理で重たくなっちゃうよね。
そこで、通常は必要な時だけ「ここでこの内容を画面に出して！」とプログラムするんだ。

`console.log`というのはNode.js処理系組み込みの関数で、
パラメーターとして渡された「もの」を画面に表示してくれるよ。

<div class="note">
Note: 「画面」は実際の所は「標準出力」（stdout）と言った方が正しい。
通常、計算機には標準出力、標準エラー出力が用意されていて、
プログラマーは必要に応じてこれらへ何かを出力する事ができる様になっている。
</div>

<div class="note">
Note: さっきから「もの」という表現が登場しているが、
これはプログラミングの専門用語としても「オブジェクト」であり、つまるところ「もの」です。
プログラムはソースコードに書いた事がそのまま実行される訳ですが、
その実行はプログラミングの初学者がソースコードに対して直感的に思うよりも
ずっと細かい事を忘れてはいけません。
例えば、`a=1+1`で`a`に代入されている「もの」はなんでしょう？この感覚を忘れないで下さいね。
</div>

さて、ファイルができたなら端末で`node`コマンドに次の様にこのファイルを指定して実行させてみよう:

    % node your-source.js
    Hello, JavaScript! 1
    Hello, JavaScript! 2
    Hello, JavaScript! 3
    Hello, JavaScript! 4
    Hello, JavaScript! 5
    Hello, JavaScript! 6

お疲れ様でした！

これでJavaScriptのプログラムを作れる様になったね！

…まだ変数と関数しか使えないって？ちらっと言ったかもしれないけれど、
JavaScriptは「関数型言語」でもあるんだよ。関数と変数が使えたら、
大抵のことはできちゃうよ！…それだけだと、ちょっとコツを知らないと大変かも知れないけどね。

<div class="note">
Note: もしも、普段Windowsを何気なく使っていて、
この講座で初めて`cmd`を使ったとしたら少々困ってしまっているかもしれない。
「`cmd`は動かせたみたいだけど、これはなに？」、或いは「ここはどこ？」とか。
念の為、以下にWindowsの`cmd`を動かしてから、
`node`に`your-source.js`を実行するまでの詳説を
[1.A.3.Windowsとcmdでの実行例](#a.3.windowsとcmdでの実行例)に付けるので参考に。
</div>

## 1.A.付録

授業の後で学生さんたちから届いていたメッセージに答えるよ！

### 1.A.1.○○についてもう一度！

このページを見て頑張ってね！

（※註、このページは授業の後に公開したものです。）

### 1.A.2.お勧めのテキストエディタを教えて下さい

幾つかのお手軽で便利っぽくて軽量なテキストエディターたちを紹介しよう！

<div class="recommend">

(推奨: 簡単で便利で軽い、みたいな)

<div class="inner-li-to-tile">

* for Windows
    * [notepad++][notepad++]
    * [GEdit][GEdit]
* for Mac OS X
    * [CotEditor][CotEditor]
    * [GEdit][GEdit]
* for Linux
    * [Kate][Kate]
    * [GEdit][GEdit]

</div>

[notepad++]: http://notepad-plus-plus.org/
[CotEditor]: http://sourceforge.jp/projects/coteditor/
[Kate]:      http://kate-editor.org/
[GEdit]:     http://projects.gnome.org/gedit/

</div>

<div class="optional">

(もし使いたければ: プロの道具)

* [Vim][Vim] for the Linux and the UNIX
    * [Vim(Kaoriya)][Vim(Kaoriya)] for Windows
* plugins
    * [vim-quickrun][vim-quickrun]
    * [neocomplcache][neocomplcache]

[Vim]:          http://www.vim.org/
[Vim(Kaoriya)]: http://www.kaoriya.net/software/vim

[vim-quickrun]:  https://github.com/thinca/vim-quickrun
[neocomplcache]: https://github.com/Shougo/neocomplcache

(ついでなので一応: JavaScriptに対応したIDEもあるよ)

* [NetBeans][NetBeans] ([->ja][NetBeans(ja)])
* [Eclipse][Eclipse] ([->ja][Eclipse(ja)])
* [Visual WebDevelopper][VWD]

[NetBeans]:     http://www.netbeans.org/
[NetBeans(ja)]: http://ja.netbeans.org/
[Eclipse]:      http://www.eclipse.org/
[Eclipse(ja)]:  http://mergedoc.sourceforge.jp/
[VWD]:          http://www.microsoft.com/japan/msdn/vstudio/express/

</div>

<div class="note">
Note: 但し私は Mac OS X の実機を所有していないので、
それについては Twitter や Facebook で教えて貰った情報を元に
スクリーンショットや紹介を読んで判断しています。
</div>

### 1.A.3.Windowsとcmdでの実行例

↓`Win+R`→`cmd`で端末を起動:

![figure.1.A.3.-1][1.A.3.-1]

↓端末（cmd.exe）が起動した！:

![figure.1.A.3.-2][1.A.3.-2]

↓`node`コマンドを実行してNode.jsインタープリターを使ってみる:

![figure.1.A.3.-3][1.A.3.-3]

↓`cd`コマンドで「カレントディレクトリ」（現在居るフォルダの階層）を移動できる。
但し、ディレクトリ（＝フォルダ）の名前に半角スペースが入っている場合には名前を`"`で囲んであげないとダメ。:

![figure.1.A.3.-4][1.A.3.-4]

↓メモ帳は`notepad`コマンドでも起動できて、`nodepad hoge.js`みたいにファイル名を指定して作り始める事もできる。
ソースを編集したなら保存しよう:

![figure.1.A.3.-5][1.A.3.-5]

↓`node hoge.js`で実行できました！:

![figure.1.A.3.-6][1.A.3.-6]

↓`cd ..`とやると１つだけ上位（親）のディレクトリへ移動できます。
ちなみに、実はここで`node "My Documents¥hoge.js"`の様にディレクトリやファイルの階層を`¥`で繋いで
「ファイルのパス」を現在のディレクトリからの相対的な位置関係を示して実行する事もできます:

![figure.1.A.3.-7][1.A.3.-7]

[1.A.3.-1]: images/win-cmd-node-1.png
[1.A.3.-2]: images/win-cmd-node-2.png
[1.A.3.-3]: images/win-cmd-node-3.png
[1.A.3.-4]: images/win-cmd-node-4.png
[1.A.3.-5]: images/win-cmd-node-5.png
[1.A.3.-6]: images/win-cmd-node-6.png
[1.A.3.-7]: images/win-cmd-node-7.png

