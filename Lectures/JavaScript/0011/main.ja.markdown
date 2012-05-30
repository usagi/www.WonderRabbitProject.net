--
title:     11. JavaScriptの言語組み込みオブジェクト（Array編）
parent:    JavaScript ⇠ Lectures
published: 2012-05-19 15:25
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0011/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 概要

既にJavaScriptの言語としての基礎、
つまり式、文、宣言、定義、ハッシュオブジェクト、関数オブジェクト等について学び、
独力でも（時間と労力を気にせずに）頑張ればたいていの何かは作れる様な気がしているかもしれない。

しかし、実際の開発では全てのプログラムの部品を毎回作り直す事は無く、
ある目的に対して汎用的に使用可能な部品の塊であるライブラリー（ctorを含めた関数定義の塊）を
作成しておいてそれを使う。

特に頻繁に使用される機能群は多くの言語（もちろんＣ＋＋やＪａｖａでも）で「標準ライブラリー」
などと呼ばれ、言語仕様として言語処理系の実装に標準で同梱して含める事になっている事が多い。

JavaScriptにも標準ライブラリーに相当する言語組み込みオブジェクトが[ECMA-262]§15で定義されている。
今回から数回は言語仕様書を読みながら、どの様な便利機能が標準で使用可能なのか確認するとしましょう。

<div class="note">
Note: 現実の講義ではレクチャー１コマ＋演習２コマのバランスで進め、
今回の内容はArray.prototype.every以降とそれより前に分け、計２コマで解説する。
</div>

##### 内容

<nav>

- [11.1 Arrayのコンストラクト](#arrayのコンストラクト)
- [11.2 Array.isArray](#array.isarray)
- [11.3 Array.prototype](#array.prototype)
    - [11.3.1 Array.prototype.toString](#array.prototyoe.tostring)
    - [11.3.2 Array.prototype.toLocaleString](#array.prototyoe.tolocalstring)
    - [11.3.3 Array.prototype.concat](#array.prototyoe.concat)
    - [11.3.4 Array.prototype.join](#array.prototyoe.join)
    - [11.3.5 Array.prototype.pop](#array.prototyoe.pop)
    - [11.3.6 Array.prototype.push](#array.prototyoe.push)
    - [11.3.7 Array.prototype.reverse](#array.prototyoe.reverse)
    - [11.3.8 Array.prototype.shift](#array.prototyoe.shift)
    - [11.3.9 Array.prototype.slice](#array.prototyoe.slice)
    - [11.3.10 Array.prototype.sort](#array.prototyoe.sort)
    - [11.3.11 Array.prototype.splice](#array.prototyoe.splice)
    - [11.3.12 Array.prototype.unshift](#array.prototyoe.unshift)
    - [11.3.13 Array.prototype.indexOf](#array.prototyoe.indexof)
    - [11.3.14 Array.prototype.lastIndexOf](#array.prototyoe.lastindexof)
    - [11.3.15 Array.prototype.every](#array.prototyoe.every)
    - [11.3.16 Array.prototype.some](#array.prototyoe.some)
    - [11.3.17 Array.prototype.forEach](#array.prototyoe.foreach)
    - [11.3.18 Array.prototype.map](#array.prototyoe.map)
    - [11.3.19 Array.prototype.filter](#array.prototyoe.filter)
    - [11.3.20 Array.prototype.reduce](#array.prototyoe.reduce)
    - [11.3.21 Array.prototype.reduceRight](#array.prototyoe.reduceright)
- [11.4 length](#length)

</nav>

## 11.1 Arrayのコンストラクト

Array Object（∋配列リテラルで生成されるオブジェクト）は[ECMA-262]§15.4で定義されています。

§15.4.1では`new`を付けずに`Array`関数を呼び出しても`new Array`を呼ぶのと同じ事になる旨、
§15.4.2では`new Array`コンストラクターの呼び出しに定義可能なパラメーターについて定義されています。

- new Array([item1[, item2[, item3[, ...]]]])
    - 参考: var a = [item1, item2, item3, ...]  （文書と文法の大カッコの意味の違いに注意）
- new Array(len)
    - 配列の初期サイズを指定するctor
    - 各要素の初期値は`undefined`

§15.4.3はArray Objectについて便利な機能群をメンバー関数として使える様にするプロトタイプや
ctorから直接使用可能な便利な関数とプロパティの定義です。

## 11.2 Array.isArray

引数で与えられたオブジェクトがArrayであるか判定します。

    > Array.isArray([1,2,3])
    true
    > Array.isArray(12345)
    false

JavaScriptでは静的な強い型付けができませんから、ある関数の引数としてArrayを想定した仕様に対し、
ユーザーが本当にArrayを渡して呼び出したのか判断する必要がある際などに用いると良いでしょう。

なお、この関数だけはArrayコンストラクターオブジェクトそのもののメンバーとして定義されており、
prototypeではありません。

## 11.3 Array.prototype

Arrayには[ECMA-262]で定義される言語組み込みのプロトタイプが多数存在します。
これらを使い熟す事はインテリジェントかつコンパクトでスマートなプログラムを実装する手助けとなるでしょう。

### 11.3.1 Array.prototype.toString

Arrayオブジェクトの全ての要素に対し.toStringを処理し、
結果からArrayオブジェクトを文字列にします。

    > [1,2,3].toString()
    '1,2,3'
    > ['紀州','南高梅',50,'グラム'].toString()
    '紀州,南高梅,50,グラム'

配列の中身を文字列として表示したり、
CSV形式のテキストデータベースとして得たい場合には使えるかもしれません。

### 11.3.2 Array.prototype.toLocaleString

.toStringのロケール（文化圏；地域と言語）を考慮する版です。
後の回で確認するDateオブジェクトなど、文字列表現が文化圏によって異なるオブジェクトに対し、
システムロケールに併せた出力を行います。

### 11.3.3 Array.prototype.concat

１つ以上のArrayを結合します。

空っぽのArrayに0個のArrayを結合する例:

    > [].concat()
    []

３つのArray a,b,cがあった時、bに対しaとcを結合する例:

    > a = [1,2,3], b = [4,5,6], c = [7,8,9]
    [7,8,9]
    > b.concat(a,c)
    [4,5,6,1,2,3,7,8,9]

※カンマ演算子（`,`）は左側の処理を行った後、その出力（`return`）は無視して右側の処理を行うので、
a,b,cをカンマ区切りで一度に定義すると最後に定義したcの内容だけが表示される。aとbも定義は行われている。

`.concat`では引数のArrayは１段階のみ自動的に展開して結合される点に注意すること:

    > [1,2,3].concat(4,5,6,[7,8,9])
    [1,2,3,4,5,6,7,8,9]

２段にネストされたArrayを`.concat`する例:

    > [1,2,3].concat(4,[5,6],[[7,8],[9]])
    [1,2,3,4,5,6,[7,8],[9]]

### 11.3.4 Array.prototype.join

Arrayを任意の文字列をセパレーターとして結合する。

    > [1,2,3].join('-')
    '1-2-3'
    > [1,2,3].join('++**++')
    '1++**++2++**++3'
    > [1,2,3].join('\n')
    '1\n2\n3'

### 11.3.5 Array.prototype.pop

Arrayの末尾の要素１つを取り出す。

    > a = [1,2,3]
    [1,2,3]
    > a.pop()
    3
    > a
    [1,2]

### 11.3.6 Array.prototype.push

Arrayの末尾に要素を追加し、追加後の要素数を`return`する。

    > a = [1,2,3]
    [1,2,3]
    > a.push(4)
    4
    > a
    [1,2,3,4]

複数の要素を一度に追加する事もできる: 

    > a = [1,2,3]
    [1,2,3]
    > a.push(4,5,6)
    6
    > a
    [1,2,3,4,5,6]

`.concat`の様な自動展開は行われない:

    > a.push(7,[8,9])
    8
    > a
    [1,2,3,4,5,6,7,[8,9]]

### 11.3.7 Array.prototype.reverse

Arrayの全ての要素の順序を逆転する。

    > a = [1,2,3]
    [1,2,3]
    > a.reverse()
    [3,2,1]
    > a
    [3,2,1]

### 11.3.8 Array.prototype.shift

Arrayの先頭の要素１つを取り出す。`.pop`（末尾）の先頭版。`.pop`に対する`.push`相当の`.unshift`と対。

    > [1,2,3].shift()
    1
    > [1,2,3].reverse().shift()
    3

### 11.3.9 Array.prototype.slice

Arrayの任意の区間の要素を参照する。切り出しでは無いので元のArrayに変化は生じない。

    > a = ['石勺柏','蜜柑','甘藍','林檎','芽花野菜']
    ['石勺柏','蜜柑','甘藍','林檎','芽花野菜']
    > a.slice(2,4)
    ['蜜柑','林檎']
    > a
    ['石勺柏','蜜柑','甘藍','林檎','芽花野菜']

区間はArrayのインデックスで`[開始位置,終端位置)`を指示する。
開始位置は含まれ、終端位置は含まれない事に注意する事。

### 11.3.10 Array.prototype.sort

Arrayをソートする。ソートの安定性については仕様で要求されておらず、
アルゴリズムも処理系に依存。

    > a = [4,5,6,1,2,3,7,8,9]
    [4,5,6,1,2,3,7,8,9]
    > a.sort()
    [1,2,3,4,5,6,7,8,9]

[ECMA-262]のsortは癖が強い。
癖の１つは`.sort`を適用すると、Array自身がソートされてしまい、ソート前の状態は保存されない事。

もっと厄介な癖の２つめは`.sort`はデフォルトで要素を文字列としてソートする事。
要素が数値だけの場合にうっかり嵌りやすいので注意する事。

    > a = [99,1,3,5,22,11,4,5,6,100]
    [99,1,3,5,22,11,4,5,6,100]
    > a.sort()
    [1,100,11,22,3,4,5,5,6,99]

`.sort`は引数に比較関数オブジェクトを渡せるので、
数値の大小関係に基づいたソートを適用したい場合には次の様にすれば良い:

    > a.sort(function(a,b){return a-b;})
    [1,3,4,5,5,6,11,22,99,100]

比較関数はソートの内部処理で用いられる２つの比較対象の値を引数とし、数値を`return`する関数である。
ユーザーはここに任意の関数オブジェクトを渡す事で自由に`.sort`をカスタマイズできる。

### 11.3.11 Array.prototype.splice

Arrayの任意の位置から任意の数の要素を取り出し、取り出した場所に任意の要素群を内挿する。
`.slice`と良く似ているが引数と動作は異なる点が多いので注意する事。

位置2から2つの要素を取り出す例:

    > a = [1,2,3,4,5,6]
    [1,2,3,4,5,6]
    > a.splice(2,2)
    [3,4]
    > a
    [1,2,5,6]

取り出しと同時に内挿する例:

    > a = [1,2,3,4,5,6]
    [1,2,3,4,5,6]
    > a.splice(2,2,-1,-2,-3)
    [3,4]
    > a
    [1,2,-1,-2,-3,5,6]
    > a.splice(3,2,[0.1,0.2],[0.3,0.4])
    [5,6]
    > a
    [1,2,-1,[0.1,0.2],[0.3,0.4],5,6]

### 11.3.12 Array.prototype.unshift

Arrayの先頭に要素を追加し、追加後のArrayの要素数を`return`する。
`.shift`と対になる機能で`.pop`に対する`.push`に対応する。

    > a = [1,2,3]
    [1,2,3]
    > a.unshift(4)
    4
    > a
    [4,1,2,3]
    > a.unshift(5,6)
    [5,6,4,1,2,3]

### 11.3.13 Array.prototype.indexOf

Arrayから要素を`==`で探し、見つかった位置を`return`する。

    > [1,11,111,2,22,222].indexOf(2)
    3

探索を開始する位置を第二引数で指示する事もできる。

    > [1,3,1,3,1,3,1,3].indexOf(1)
    0
    > [1,3,1,3,1,3,1,3].indexOf(1,3)
    4

### 11.3.14 Array.prototype.lastIndexOf

`.indexOf`の探索順が末尾から版。
数える順序は末尾要素が0番目となるが、`return`されるインデックスは先頭から数えた値となる。

    > [1,3,1,3,1,3,1,3].lastIndexOf(1)
    6
    > [1,3,1,3,1,3,1,3].lastIndexOf(1,3)
    2

### 11.3.15 Array.prototype.every

Arrayの要素全てがある条件を満たしているか判定する。
条件は関数で与え、要素１つを引数としBoolean型を`return`する。

あるArrayの要素全てが奇数であるか判定する例: 

    > [1,3,5,7,9].every(function(a){return a%2===1;})
    true

あるArrayの要素全てが10以上であるか判定する例:

    > [20,4,7,11,18,24].every(function(a){return a>=10;})
    false

### 11.3.16 Array.prototype.some

Arrayの要素の何れか少なくとも１つ以上が条件を満たしているか判定する。

あるArrayが３の倍数を少なくとも１つ以上含んでいるか判定する例:

    > [1,2,3,4,5].some(function(a){return a!==0 && a%3===0;})
    true

### 11.3.17 Array.prototype.forEach

Arrayの要素全てに関数を適用する。
`for-in`文を用いるのと結果的には同じ。

    > [1,2,3,4,5].forEach(function(a){console.log(a*a);})
    1
    4
    9
    16
    25
    undefined

※最後の`undefined`はforEach自体は`return`が未定義な為にそれ自体の評価結果は`undefined`となる。

### 11.3.18 Array.prototype.map

Arrayの要素全てに関数を適用した結果のArrayを得る。

    > a = [1,2,3,4,5]
    [1,2,3,4,5]
    > a.map(function(a){return a*a})
    [1,4,9,16,25]
    > a
    [1,2,3,4,5]

### 11.3.19 Array.prototype.filter

Arrayの要素のうち、条件を満たす要素のみからなるArrayを得る。

あるArrayから2の倍数を得る例: 

    > a = [1,2,3,4,5]
    [1,2,3,4,5]
    > a.filter(function(a){return a!==0 && a%2===0;})
    [2,4]
    > a
    [1,2,3,4,5]

### 11.3.20 Array.prototype.reduce

Arrayの全ての要素に対し、先頭（左側）から順に畳み込む。

    > a = [1,2,3,4,5]
    [1,2,3,4,5]
    > a.reduce(function(a,b){return a*b;})
    120

`.reduce`の内部処理は、
初めに`function(a,b){return a*b}`は(a=2,b=1)として呼ばれ、
その結果`return 2*1`は次の呼び出しで`b`に引き継がれる。
２回目の呼び出しでは(a=3,b=2)となり`return 3*2`、
３回目の呼び出しでは(a=4,b=6)となり`return 4*6`、
４回目の呼び出しでは(a=5,b=24)となり`return 5*24`、
それ以上Arrayにaへと取り出す要素が無いので`.reduce`はここで処理を終え、
結果`120`を`return`する。

### 11.3.21 Array.prototype.reduceRight

Arrayの全ての要素に対し、終端（右側）から順に畳み込む。

    > a = [1,2,3,4,5]
    [1,2,3,4,5]
    > a.reduceRight(function(a,b){return a*b;})
    120

上記の例では`.reduce`も`.reduceRight`も同じ結果となる。
しかし、畳み込み演算の内容が`a*b`ではなく`a/b`ならばどうだろうか？

    > a.reduce     (function(a,b){return a/b;})
    0.008333333333333333
    > a.reduceRight(function(a,b){return a/b;})
    0.20833333333333334

この様に畳み込む順序により結果が異なる演算が必要な場合には注意する必要がある。

<div class="note">
Note: [ECMA-262]のArray.prototypeの`.reduce`/`.reduceRight`は
C++ならば`std::accumulate`、Haskellならば`foldl`/`foldr`に相当します。
</div>

### 11.4 length

最後にArrayインスタンスが持つlengthプロパティを紹介します。
JavaScriptのプロパティは言語組み込みで参照できる変数の様なものと思えば良いでしょう。

    > [1,2,3].length
    3

Arrayインスタンスの評価時点での長さを参照できます。

注意として、lengthはArrayプロトタイプ関数としては定義されていませんので、
関数適用演算子`()`を付けずに用いる事を覚えて措きましょう。

[prev]: ../0010/
[next]: ../0012/

[gist]:   http://gist.github.com/
[ideone]: http://www.ideone.com/

[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm

