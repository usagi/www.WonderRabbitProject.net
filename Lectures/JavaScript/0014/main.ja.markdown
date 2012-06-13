--
title:     14. JavaScriptの言語組み込みオブジェクト（JSON編）とCOOKIE
parent:    JavaScript ⇠ Lectures
published: 2012-06-12 02:30
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0013/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 概要

[ECMA-262]の言語組み込みオブジェクトの解説予定としては、
JSONとRegExpが残っています。今回はJSONと、それに関連して
ウェブブラウザーが簡易的に用意してくれるかもしれない
COOKIEの実用例について学習しましょう。

##### 内容

<nav>

- [14.1 JSON言語組み込みオブジェクト](#json言語組み込みオブジェクト)
    - [14.1.1 オブジェクト→JSON](#オブジェクトjson)
    - [14.1.2 JSON→オブジェクト](#jsonオブジェクト)
- [14.2 COOKIE](#cookie)
    - [14.2.1 使用可能？](#使用可能)
    - [14.2.2 書き込み](#書き込み)
    - [14.2.3 読み込み](#読み込み)

</nav>

## 14.1 JSON言語組み込みオブジェクト

JavaScriptの実行単位を跨いで何らかの値を渡したい時に用いるのがJSONである。
JSONは、実は単に実行中のJavaScriptのメモリーに存在するオブジェクトを
ハッシュオブジェクトのリテラルへと逆変換した文字列の事である。

例えば:

    { 'abc': 123, 'def': 456 }

これは[ECMA-262]のソースコードとして評価すればハッシュオブジェクトとして
評価される文字列であると同時に、その様なオブジェクトのJSON表現でもある。

一般に計算機が処理中のメモリーオブジェクトを文字列などに書き出し、
保存して別の実行単位で読み込める様にする事をデータのシリアライズと云う。

逆に、シリアライズされた文字列などを読み込みメモリーオブジェクトを
復元する事をデシリアライズと云う。

JSONはJavaScriptを初め、
比較的多くの処理系がサポートするシリアライズ形式の１つとなっている。
例えばTwitter APIやGoogle Search APIなども
JSONを用いてデータを送受信する仕様である。

現在の[ECMA-262]ではJSONを簡単に扱える様、
JSON言語組み込みオブジェクトが定義されている。

### 14.1.1 オブジェクト→JSON

`JSON.stringify`の引数にオブジェクトを渡す事でJSONを得られる。

    > a = {'abc': 123, 'def': 456}
    { abc: 123, def: 456 }
    > j = JSON.stringify(a)
    '{"abc":123,"def":456}'

### 14.1.2 JSON→オブジェクト

`JSON.parse`の引数にJSONを渡す事でオブジェクトを得られる。

    > j
    '{"abc":123,"def":456}'
    > b = JSON.parse(j)
    { abc: 123, def: 456 }

<div class="note">
Note: JavaScript暗黒時代には`JSON.parse`の役割で
`eval`が用いられる事もあった。
`eval`はJSONをパースするのではなく、JavaScriptのソースを評価する。
もちろんこの機能を用いれば面白い事もできるのだが、
特にユーザーからの入力を元に`eval`する様なコードでは、
プログラムが開発者の意図しない動作を引き起こす事は想像するに難くないだろう。
</div>

## 14.2 COOKIE

ウェブアプリケーション、特にJavaScriptはストレージの制約が非常に厳しい。
これはセキュリティの観点から仕方無い事でもある。
昨今ではJSONを用いてREST型のインターフェースを持つ
データベースサーバーを用いたり、
或いはHTML5 Web Storageも使用可能になりつつある。

とは言え、執筆現在でウェブブラウザー上で最も広く使われている
簡易的なストレージがある。それがCOOKIEである。

COOKIEを用いればウェブブラウザーの気分次第ではあるが、
文字列情報をキーと値の組み合わせで保存したり、読み出したりできる。

なお、COOKIEは[ECMA-262]で言語仕様としては具体的に触れられておらず、
処理系依存の機能実装となる。
但し、一般に多くのウェブブラウザーではサポートされ、使用可能である。

<div class="note">
Note: 本節はCOOKIEが有効なウェブブラウザー上でなければ試すことができない。
どこでも良いので適当なウェブページを、
ChromiumやFirefox+Firebugなどの環境で開き
コンソール機能を使うと良いでしょう。
</div>

### 14.2.1 使用可能？

`window.navigator.cookieEnabled`を評価する事でCOOKIEが使用可能か分かる。

    > window.navigator.cookieEnabled
    true

### 14.2.2 書き込み

最も簡単なCOOKIEは`document.cookie`へ文字列`'key=value'`の形式で出力します。

    > document.cookie = 'key=value'

但し、この方法ではウェブブラウザーがページを閉じると同時に
COOKIEも削除されます。

ウェブブラウザーがページを閉じても
指定期日まで保存される様にお願いする方法は、

    > document.cookie = 'key=value; expires=' + new Date(2100,0).toGMTString()
    "key=val; expires=Tue, 30 Nov 2100 15:00:00 GMT"

この様に`;`で区切ってexpiresをGMTで設定します。
Dateオブジェクトに対し`toGMTString`を用いればGMTを得られます。

有効期限がまだ先のCOOKIEを削除する場合には、
expiresに過去の時刻を入れて`document,cookie`に設定します。
過去の日付は`new Date(0).toGMTString()`などすれば簡単に得られるでしょう。

なお、COOKIEに設定する値は
実際には`escape`により一部文字の置き換えが必要なので、

    > document.cookie = 'some_key=' + escape(some_value);

などすると良いでしょう。

<div class="note">
Note: COOKIEには他にも設定可能な項目が幾つかあり、
key毎にexpiresの例の様に`;`で区切って項目を並べて指示できます。
これについては言語仕様書は無いので、
実装毎に各ウェブブラウザーのドキュメントを読む必要があります。
とは云え、基本的には[とほほのCookie入門](http://www.tohoho-web.com/wwwcook.htm)など眺めれば実用には十分でしょう。
</div>

### 14.2.3 読み込み

COOKIEは`document.cookie`で参照できます。

    > document.cookie
    "key=val"

複数のkeyが保存されている場合は、

    > document.cookie
    "k1=v1; k2=v2; k3=v3"

の様に得られます。単なる文字列なので`split(';')`すれば
COOKIEのkeyとvalueが=で連結された状態の文字列の配列が得られます。

    > document.cookie.split(';')
    ["k1=v1", " k2=v2", "k3=v3"]

この各要素を更に`.trim().split('=')`すれば、
keyとvalueのペアーを扱いやすい状態になります。

    > document.cookie.split(';').map( function(a){ return a.trim().split('='); })
    [ ['k1', 'v1'], ['k2','v2'], ['k3', 'v3'] ]

実際にはvalueは`escape`により
一部の文字を置き換えた状態で格納されているはずですから、
valueを取り出す際に`unescape`すると良いでしょう。

以上の様にCOOKIEを用いて、簡単なストレージを得る事ができます。
余程大きくなければCOOKIEにゲームのプレイ状態やスコアを、
JSONで出力するなどしても有用でしょう。

<div class="note">
Note: 注意点として、
COOKIEにパスワードを保存する様な使い方は絶対にしてはなりません。
COOKIEは簡単に覗き見る事も、また書き換える事も可能であり、
この様なストレージに平文のセキュリティ情報を保存すべきではありません。
</div>

[prev]: ../0011/
[next]: ../0013/

[gist]:   http://gist.github.com/
[ideone]: http://www.ideone.com/

[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm

