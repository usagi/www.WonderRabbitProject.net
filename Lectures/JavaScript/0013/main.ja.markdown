--
title:     13. JavaScriptの言語組み込みオブジェクト（String&amp;Date編）
parent:    JavaScript ⇠ Lectures
published: 2012-06-11 23:30
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0013/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 概要

JavaScript([ECMA-262])の言語組み込みオブジェクトについての概説を、
Array、Mathと学習して来ました。

続いて今回はStringとDateについて言語仕様を確認するとしましょう。

##### 内容

<nav>

- [13.1 文字列オブジェクトのプロトタイプとプロパティ](#文字列オブジェクトのプロトタイプとプロパティ)
    - [13.1.1 文字と文字コードの変換 fromCharCode charCodeAt](#文字と文字コードの変換)
    - [13.1.2 結合 concat](#文字列の結合)
    - [13.1.3 検索 indexOf lastIndexOf](#文字列の検索)
    - [13.1.4 分割 slice split substring](#文字列の置換)
    - [13.1.5 大文字と小文字 toLowerCase toUpperCase](#大文字と小文字)
    - [13.1.6 ホワイトスペースの除去 trim](#ホワイトスペースの除去)
    - [13.1.7 正規表現の使用](#正規表現の使用)
    - [13.1.8 長さを得るプロパティ length](#長さを得るプロパティ)
- [13.2 Dateオブジェクトによる日付の取り扱い](#Dateオブジェクトによる日付の取り扱い)
    - [13.2.1 現在時刻の取得](#現在時刻の取得)
    - [13.2.2 特定時刻の取得](#特定時刻の取得)
    - [13.2.3 時間の計算](#時間の計算)

</nav>

## 13.1 文字列オブジェクトのプロトタイプとプロパティ

文字列オブジェクト`String`の
有用なプロトタイプとプロパティについて確認しよう。

### 13.1.1 文字と文字コードの変換 fromCharCode charCodeAt

計算機で扱われる文字の計算機内部での表現は当然数値です。
現在、最も有名で代表的な例は[ASCII](http://ja.wikipedia.org/wiki/ASCII)です。
また、日本語を扱う際には、以前はEUC-JP、JIS、CP932などの文字コード群が
用いられていましたが、近年では日本語を含むあらゆる文字を
１つのコード体系で扱うUNICODEが使われる様になりました。

[ECMA-262]では数値から文字を得る`fromCharCode`と
文字から数値を得る`charCodeAt`を使用できます。

`fromCharCode`は引数の数値を文字に変換します。

    > String.fromCharCode(65)
    'A'
    > String.fromCharCode(66)
    'B'
    > String.fromCharCode(67)
    'C'

`charCodeAt`は定義済みの文字列の引数番目の文字を数値に変換します。

    > 'ABC'.charCodeAt(0)
    65
    > 'ABC'.charCodeAt(1)
    66
    > 'ABC'.charCodeAt(2)

<div class="note">
Note:
実は[ECMA-262]で定義される機能ではUNICODEを正しく扱えません。
シーザー暗号のゲームを作るくらいには
ASCIIだけでも使いどころがあるかもしれませんね。
</div>

### 13.1.2 結合 concat

Arrayオブジェクトの結合でも登場した`concat`が
プロトタイプとして定義済されています。

`concat`はArrayのものとほぼ同様の挙動を示します。
但し、文字列同士ではなく、文字列を含んだ配列や、
文字列を含んだ配列の配列に対する挙動はArrayとは少々異なり
全て展開した上で要素をコンマ区切りで結合となるので気をつけましょう。

    > 'ABC'.concat('def', 'GHI', ['x','y','z'],[['!','!!','!!!'],['#','##','###']])
    'ABCdefGHIx,y,z!,!!,!!!,#,##,###'

<div class="note">
Note: 機能的に、Arrayオブジェクトの`join`と混同しない様に注意しましょう。
</div>

<div class="note">
Note: 二項演算子の`+`は引数の何れかがStringオブジェクトの場合は

    String(第一引数).concat(第二引数)

と同じ結果となります。
</div>

### 13.1.3 検索 indexOf lastIndexOf

文字列aの中で文字列bが最初に出現する先頭からの位置を返すのが`indexOf`、
文字列aの中で文字列bが最後に出現する先頭からの位置を返すのが`lastIndexOf`です。

    > a = 'hello, ECMA-262!'
    'hello, ECMA-262!'
    > b = 'ECMA'
    'ECMA'
    > a.indexOf(b)
    7
    > a.lastIndexOf(b)
    7

Arrayオブジェクトの際と同様に、
２つ目の引数に検索開始位置を明示する事もできます。

    > a.indexOf(b, 3)
    7

検索の結果、bが出現しなかった場合には`-1`が返されます。

    > a.indexOf(b, 9)
    -1

### 13.1.4 分割 slice split substring

`slice`はArray同様に\[begin-end)を切り出します。

    > 'abcdef'.slice(2,4)
    'cd'

cは2文字目ではなく、
文字列の0から始まるインデックスによる位置である点に気をつけましょう。

`split`は文字列aを文字列bで分割した配列を得ます。

    > a = 'a,bb,ccc,dddd'
    'a,bb,ccc,dddd'
    > b = ','
    ','
    >a.split(b)
    [ 'a',
      'bb',
      'ccc',
      'dddd' ]

`substring`は`slice`と同様なので説明は省きます。

<div class="note">
Note: [ECMA-262]の定義にはありませんが、
現在の世の中の多くのJavaScriptの実装では
`substring`と紛らわしい`substr`という良く似た関数が定義されています。
位置による[開始位置-終了位置)ではなく、開始位置と文字数を引数とします。
それらは例えばこんな風に異なる挙動を示します:

    > 'abcdef'.substring(2,4)
    'cd'
    > 'abcdef'.substr(2,4)
    'cdef'

どうしてこんな紛らわしい実装があるのかは歴史的な経緯によりますが、
実用上は`substr`が便利な場合もあります。
例えば第一引数を負の値にすると後ろから数えた動作になったり…。

    > 'abcdef'.substr(-4,2)
    'cd'

lastIndexOfと併せるとファイル名から拡張子部分を切り出す処理などが
簡単に書けるなどします。

…歴史的経緯にJavaScriptの闇の一端が垣間見えましたか・ｗ・？
</div>

### 13.1.5 大文字と小文字 toLowerCase toUpperCase

文字列オブジェクトを小文字に変換する`toLowerCase`と、
大文字に変換する`toUpperCase`が用意されています。

    > 'abcDEF'.toLowerCase()
    'abcdef'
    > 'abcDEF'.toUpperCase()
    'ABCDEF'

条件分岐の判定パターンを絞り込んだり、
ユーザーからの入力を正規化する際に有用です。

### 13.1.6 ホワイトスペースの除去 trim

文字を取り扱う際、
一般に空白文字とそれに準じる文字ならぬ文字群を総称して
ホワイトスペースと呼びます。準じる文字ならぬ文字とは、
例えば改行文字やタブ文字などが分り易い例です。

`trim`を使うと文字列の前後にくっついた
ホワイトスペース部分のみを除去できます。

    > '  \t\thoge\t\t'.trim()
    'hoge'

### 13.1.7 正規表現の使用

Stringオブジェクトには正規表現を扱う機能があります。
`match`ではパターンのマッチング結果を、
`search`でパターンの位置を返します。

`match`が返すマッチング結果は
配列とハッシュオブジェクトを理解していれば簡単に理解できます。

    > 'abcdef'.match('[c-e]+')
      [ 'cde',
      index: 2,
      input: 'abcdef' ]

`search`はindexOfの正規表現版と思って構いません。

    > 'abcdef'.search('[c-e]+')
    2

JavaScriptの正規表現について詳しくはRegExpオブジェクトの解説とします。

<div class="note">
Note: 「正規表現」はチューリング完全なプログラミング言語では無いものの、
パターンマッチを駆使する事で変態的な表現力を発揮する恐ろしい言語である。
実装により幾つかの種類や拡張機能などがあるが、基本的なルールはほぼ同じで
多くの文字列処理で有用に活躍するので基礎だけでも把握しておくと良い。

参考: [Perl正規表現雑技](http://www.din.or.jp/~ohzaki/regex.htm)
</div>

### 13.1.8 長さを得るプロパティ length

StringオブジェクトにもArray同様に長さを取得する`length`プロパティが定義されている。

    > 'もけもけ'.length
    4

## 13.2 Dateオブジェクトによる日付の取り扱い

さて、今回はもののついでにECMAScriptで日付を取り扱う方法を紹介する。

細かい事は[ECMA-262]の"§15.9 Date Object"を参照して頂きたい。
（Dateオブジェクトから日付だけを取得する関数だとか、
秒だけを取得する関数だとか、単純だが定義は多いので煩雑な解説は省き、
実用方法を紹介する事とした。）

### 13.2.1 現在時刻の取得

    > Date()
    'Tue Jun 12 2012 00:01:08 GMT+0900 (JST)'

これは`new Date().toString()`として
Date型のオブジェクトを作成するのと同時に文字列での表現を得るのと同様。
この方法で得られるのは文字列である点に注意する事。

もしも表示するだけでなくその後に計算に使いたいのならば

    > new Date()
    Mon, 11 Jun 2012 15:03:54 GMT

とする必要がある。これはクォートで囲われていない事と、
node.jsでの表示色からも分かるように文字列型ではなく、
Date型のオブジェクトである。

### 13.2.2 特定時刻の取得

    > new Date(0)
    Thu, 01 Jan 1970 00:00:00 GMT

コンストラクターに１つだけパラメーターを渡すと、
それはEPOCHタイムからの経過秒数と見做される。

    > new Date(2000,0)
    Fri, 31 Dec 1999 15:00:00 GMT

コンストラクターに２つ以上のパラメーターを渡すと、
年、月、日、時、分、秒、ミリ秒の順に解釈される。

なお、上記の例では2000年の0番目の月（＝1月）を指定しているが、
得られた表示は1999年12月31日の15時である。
この挙動は実行環境のロケールが日本である事と、
GMTと日本現地時間の時差を考えれば理解できる。

### 13.2.3 時間の計算

Dateオブジェクトは減算できる。例えば、次のコードは
関数fの処理時間を計測して表示する:

    var f = function()
    {
      for(var n = 0; n < Math.pow(1000,2.5); ++n)
        Math.sin(n);
    };
    
    var time_begin = new Date();
    f();
    var delta_time = new Date() - time_begin;
    console.log(delta_time);

このコードを実行すると、
0から1000の2.5乗（＝31,622,776.6）未満の整数について正弦を求め、
経過した時間をミリ秒単位で表示する。

    1836

と表示されれば、f()の実行は1836ミリ秒掛かったと分かる。
この様にDateオブジェクト同士を減算すると経過時間をミリ秒で得られる。

<div class="note">
Note: この他にもDateオブジェクトには、
保持している時刻の秒の部分だけを数値として取り出したり、
数値からDateオブジェクトの日を設定するなどの
細かなプロトタイプ群が多数定義されている。
必要に応じて[ECMA-262]を参照されたい。
</div>

[prev]: ../0011/
[next]: ../0013/

[gist]:   http://gist.github.com/
[ideone]: http://www.ideone.com/

[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm

