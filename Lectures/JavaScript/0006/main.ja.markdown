--
title:     6. JavaScriptの「本当の」基礎・制御文
parent:    JavaScript ⇠ Lectures
published: 2012-04-05 08:30
--

<a target="_blank" href="https://github.com/usagi/www.WonderRabbitProject.net/commits/master/Lectures/JavaScript/0006/main.ja.markdown">
<ul class="datetime">
  <li class="published"><time pubdate datetime="$published$">$published$</time>
  <li>change log is here
</ul>
</a>

<nav>

##### 概要

前回の言語の基礎「型システム」に続き、
今回の言語の基礎**「制御文」**もしっかりと覚えて足固めに万全を期しましょう。

##### 内容

* [6.JavaScriptの「本当の」基礎・制御文](#javascriptの「本当の」基礎・制御文)
* [5.A.付録](#a.付録)
* [6.A.1.制御文を使わない「高階関数」によるループ](#)

</nav>

## 6.1.JavaScriptの制御文

実は皆さんには既に１つだけJavaScriptの制御文を軽く教えてあります。

    var x = 0;
    while ( x < 100 ) {
      console.log(x);
      x = x + 1;
    }

忘れてしまった人は[§2.3](../0002/#ループを使って問題を解くプログラムを作ろう)の
終盤の辺りをちらりと見てきても良いでしょう。

プログラミング言語に於いて**「制御文」**とは、
この`while`文の様に、
通常はソースコードの先頭から終端に向かって１つ１つ文（ステートメント）を評価して進む
プログラムの実行の流れを「制御」する為の「文」の事です。
一般にプログラムのソースコードは「制御文」を含めた様々な「文」の塊で出来ています。

<div class="note">
Note: JavaScriptの「文」は大きく２種類に分けられます。
１つは`a = 1 + 1;`の様に`;`で区切られた単位（＝「単一のステートメント」）。
もう１つは、`{ a = 2 + 3; a = a / 2; }`の様に`{`と`}`で囲まれ、
内部に複数の文を含んだ単位（＝「ステートメントブロック」（というステートメント））です。
ちなみに、更に細かい`a = 1 + 1;`の中の`a`だとか
`=`だとかは「トークン」（＝解釈上の最小単位の単語みたいなもの）と呼びます。
</div>

特定の言語によらず、一般に用いられている多くのプログラミング言語では、
制御文を言語仕様で定義しています。
今回は現在一般に用いられているJavaScript処理系のベースとなっている
[ECMA-262][ECMA-262]で定められた制御文について１つ１つしっかりと学習しましょう。

### 6.2.JavaScriptの制御文の一覧

次に、JavaScriptで用いられる制御文について、
[ECMA-262][ECMA-262]の定義セクションを併せて一覧にします。

- 単純な繰り返しの為の文
    - while系
        - ① do { ... } while( ... ); // "§12.6.1 The do-while Statement"
        - ② while ( ... ) { ... } // "§12.6.2 The while Statement"
    - for系
        - ③ for( ... ; ... ; ... ){ ... } // "§12.6.3 The for Statement"
        - ④ for( ... in ... ){ ... } // "§12.6.4 The for-in Statement"

- 他の制御文の中でその制御の流れを変える為の文
    - ⑤ continue // "§12.7 The continue Statement"
    - ⑥ break // "§12.8 The break Statement"
    - ⑦ return // "§12.9 The return Statement"

- 条件分岐の為の文
    - ⑧ if // "§12.5 The if Statement"
    - ⑨ switch // "§12.11 The switch Statement"

<div class="note">
Note: 他に、`throw`文と`try`文が必修の制御文として存在するのですが、
これらの文（「例外処理」について）は特に重要であるのでまた別の回に改めて紹介します。
</div>

今回は以上の９つの制御文について存在を知り、
今後の発展への基礎固めとして使い方もしっかりと覚えてしまいましょう！

### 6.2.1.do-while文
### 6.2.2.while文
### 6.2.3.for文
### 6.2.4.for-in文
### 6.2.5.continue文
### 6.2.6.break文
### 6.2.7.return文
### 6.2.8.if文
### 6.2.9.switch文


## 6.A.付録

## 6.A.1.制御文を使わない「高階関数」によるループ]

[prev]: ../0004/
[next]: ../0006/

[gist]:   http://gist.github.com/
[ideone]: http://www.ideone.com/

[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm

