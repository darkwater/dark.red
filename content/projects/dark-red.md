- title: dark.red
- cover: /static/dark-red-cover.png
- category: ongoing

This is my personal homepage. I wrote a specific static site generator in Elixir to learn the language. It takes
Markdown documents for all the projects and blog posts, automatically creates indexes for both, and renders them to
static HTML files.

GitHub: [dark.red](https://github.com/darkwater/dark.red) &middot;
Tech used: Elixir

- - -

Instead of traditional templating, I decided to generate the surrounding HTML using a DSL in Elixir. I've done this once
before (in Javascript with Node.js I believe) but I wanted to try it again.

<pre class='vimCodeElement'>
<span class="Define">def</span> <span class="Function">header</span> <span class="Keyword">do</span>
  tag(<span class="Constant">:header</span>, [
    tag(<span class="Constant">:div</span>, [ <span class="Constant">class:</span> <span class="Special">&quot;</span><span class="String">container</span><span class="Special">&quot;</span> ], [
      tag(<span class="Constant">:h1</span>, [
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/</span><span class="Special">&quot;</span> ], [ <span class="Special">&quot;</span><span class="String">darkness</span><span class="Special">&quot;</span> ])
      ]),
      tag(<span class="Constant">:nav</span>, [
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/</span><span class="Special">&quot;</span>                    ], [ <span class="Special">&quot;</span><span class="String">about me</span><span class="Special">&quot;</span> ]),
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/projects/index.html</span><span class="Special">&quot;</span> ], [ <span class="Special">&quot;</span><span class="String">projects</span><span class="Special">&quot;</span> ]),
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/blog/index.html</span><span class="Special">&quot;</span>     ], [ <span class="Special">&quot;</span><span class="String">blog</span><span class="Special">&quot;</span> ]),
      ])
    ])
  ])
<span class="Keyword">end</span>
</pre>

`HTML.tag` takes arguments for its tag name, attributes and contents, and the resulting struct implements `String.Chars`
for `to_string`. I initially wanted to use `$handle_undefined_function` so you could write tags like `HTML.div([ class:
"content" ])` but that messed up linting in my editor.

- - -

The content of each page comes from a Markdown document. While it's mostly just standard CommonMark, each file does have
a small header for extra information:

<pre class='vimCodeElement'>
<span class="htmlTagName">-</span> title: dark.red
<span class="htmlTagName">-</span> cover: /static/dark-red-cover.png
<span class="htmlTagName">-</span> category: ongoing

This is my personal homepage. I wrote a specific static site generator in Elixir to learn the language. It takes
</pre>

I extract this header before parsing by simply splitting once on `"\n\n"` and use it for `<title>` and the
index pages. A nice side effect of this format is that it simply shows as a normal list if you open the file in a
Markdown viewer/editor.

- - -

The code highlighting isn't some fancy cmark plugin either. By default, Vim ships with a plugin that provides a
`:TOhtml` command. This converts a buffer (or selection) to an HTML page that looks just like how it's in Vim, including
syntax highlighting, folds and even diffs! So I just copy the lines containing the code and the CSS rules over.

All that HTML looks really bad in the Markdown document, but I think the result is worth it. Besides, I can just fold
the code snippets away. In fact, writing this paragraph makes me realise I could probably hide just the HTML tags in
code blocks with som Vim magic. Maybe I'll try that someday.
