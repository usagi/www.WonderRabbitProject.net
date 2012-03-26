--
title: JavaScript - Lectures
--

<nav>

Contents

* [#1 play the javascript](#1)
    * [misc.](#1-misc.)
        * [tell me once more](#1-misc.-once_more)
        * [tell me a text-editor](#1-misc.-text_editor)
* [#2 preparing git with how many rabbits pairs](#2)

</nav>

<h2 id="1">#1 play the javascript</h2>

The first, download and install the "[Node.js][Node.js]". Node.js is a very easy and very powerfull implement(included the [V8][V8] engine) and useful environment(e.g.: libraries with npm) of the JavaScript based on [ECMA-262][ECMA-262] specification. ECMA-262 is the standardizationed of a JavaScript by [ECMA][ECMA].

[Node.js]:  http://nodejs.org/
[V8]:       http://code.google.com/p/v8/
[ECMA-262]: http://www.ecma-international.org/publications/standards/Ecma-262.htm
[ECMA]:     http://www.ecma-international.org/

Next, run a terminal(;or [command prompt on Windows][cmd]) and type "node".

    (YOUR-PC PROMPT %) node
    > 

Congraturations! It's the prompt of the Node.js interpreter! Now, you can write and eval a code of the JavaScript.Try a calculation:

    > 1 + 1
    2

Congraturations!! You get the value with eval an expression as the JavaScript code. Try more expressions:

    > 1 + 2 + 3
    6
    > 4 * 5 / 6
    3.3333333333333335
    > 10 % 3
    1

It's a good calculator. :) But, it is not calculator that is implement of **the Programming Language JavaScript**. Okay, you can use a variable, function, prototype and some features with it.

Next, try a variable:

    > var a = 1
    undefined
    > a
    1
    > a + 1
    2

`var` is a language keyword. The effect is local variable declaration.

<div class="note">Note: In Windows, press `Win+R` and invoke the command `cmd` to run the cmd.exe . if you run the Node.js interpreter directory then you invoke the command `node` with the prompt.</div>


<h3 id="1-misc.">#1-misc.</h3>

I got some messages after the lecture. My answers are here:

<h4 id="1-misc.-once_more">tell me once more</h4>

I created this page. You can check and study again with it. Enjoy your learning! :)

<h4 id="1-misc.-text_editor">tell me a text-editor</h4>

There are usefull, simple and lightweight text-editors:

(Recommend)

* for Windows
    * [notepad++][notepad++]
    * [GEdit][GEdit]
* for Mac OS X
    * [CotEditor][CotEditor]
    * [GEdit][GEdit]
* for Linux
    * [Kate][Kate]
    * [GEdit][GEdit]

[notepad++]: http://notepad-plus-plus.org/
[CotEditor]: http://sourceforge.jp/projects/coteditor/
[Kate]:      http://kate-editor.org/
[GEdit]:     http://projects.gnome.org/gedit/

(Optional)

For professional:

* [Vim][Vim] for the Linux and the UNIX
    * [Vim(Kaoriya)][] for Windows
* plugins
    * [vim-quickrun][vim-quickrun]
    * [neocomplcache][neocomplcache]

[Vim]:          http://www.vim.org/
[Vim(Kaoriya)]: http://www.kaoriya.net/software/vim

[vim-quickrun]:  https://github.com/thinca/vim-quickrun
[neocomplcache]: https://github.com/Shougo/neocomplcache


And, there are IDEs:

* [NetBeans][NetBeans] ([->ja][NetBeans(ja)])
* [Eclipse][Eclipse] ([->ja][Eclipse(ja)])

[NetBeans]:     http://www.netbeans.org/
[NetBeans(ja)]: http://ja.netbeans.org/
[Eclipse]:      http://www.eclipse.org/
[Eclipse(ja)]:  http://mergedoc.sourceforge.jp/

<h2 id="2">#2 preparing git with how many rabbits pairs</h2>

There is one problem here:

> 0. A newly born pair of rabbits, one male, one female, are put in a field.
> 0. Rabbits are able to mate at the age of one month so that at the end of its second month a female can produce another pair of rabbits.
> 0. Rabbits never die and a mating pair always produces one new pair (one male, one female) every month from the second month on.
> 0. How many pairs will there be in one year?

Reference: http://en.wikipedia.org/wiki/Fibonacci\_number#Origins

Today, we try the problem use the JavaScript with social developing on GitHub!

### 

>    main = print $ reverse' [1 .. 10]
> main = print $ reverse' [1 .. 10]

<h3 id="2-misc.">#2-misc.</h3>

<!--
<h2 id="#N">#N </h2>
<h3 id="#N-misc.">#N-misc.</h3>
-->

