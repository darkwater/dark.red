- title: dark.red
- cover: /static/dark-red-cover.png

This is my personal homepage. I wrote a specific static site generator in Elixir to learn the language. It takes Markdown
documents for all the projects and blog posts, automatically creates indexes for both, and renders them to static HTML
files.

Instead of traditional templating, I decided 

<pre class='vimCodeElement'>
<span class="Define">def</span> <span class="Function">header</span> <span class="Keyword">do</span>
  tag(<span class="Constant">:header</span>, [
    tag(<span class="Constant">:div</span>, [ <span class="Constant">class:</span> <span class="Special">&quot;</span><span class="String">container</span><span class="Special">&quot;</span> ], [
      tag(<span class="Constant">:h1</span>, [ <span class="Special">&quot;</span><span class="String">darkness</span><span class="Special">&quot;</span> ]),
      tag(<span class="Constant">:nav</span>, [
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/</span><span class="Special">&quot;</span>                    ], [ <span class="Special">&quot;</span><span class="String">about me</span><span class="Special">&quot;</span> ]),
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/projects/index.html</span><span class="Special">&quot;</span> ], [ <span class="Special">&quot;</span><span class="String">projects</span><span class="Special">&quot;</span> ]),
        tag(<span class="Constant">:a</span>, [ <span class="Constant">href:</span> <span class="Special">&quot;</span><span class="String">/blog/index.html</span><span class="Special">&quot;</span>     ], [ <span class="Special">&quot;</span><span class="String">blog</span><span class="Special">&quot;</span> ]),
      ])
    ])
  ])
<span class="Keyword">end</span>
</pre>

Turns out my approach probably wasn't the best, but at least I've got some experience in Elixir now, and I got to
experiment with static site generation.
