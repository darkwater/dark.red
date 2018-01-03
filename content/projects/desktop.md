- title: desktop
- cover: /static/desktop-cover.png
- category: ongoing

I'm a ricer, which means I'm constantly tinkering with my desktop environment.

I run Void Linux with i3 as window manager, and I have a virtual machine with Windows 10 to play videogames unavailable
on Linux.

<pre>
    <span class="term-green-bold">                __.;=====;.__                 </span><span class="term-green-bold"> dark</span><span style="font-weight:bold;">@</span><span class="term-green-bold">dark-desktop</span>
    <span class="term-green-bold">            _.=+==++=++=+=+===;.              </span><span class="term-green-bold"> OS:</span> Void Linux
    <span class="term-green-bold">             -=+++=+===+=+=+++++=_            </span><span class="term-green-bold"> Kernel:</span> x86_64 Linux 4.13.6_1
    <span class="term-green">        .     </span><span class="term-green-bold">-=:``     `--==+=++==.          </span><span class="term-green-bold"> Uptime:</span> 12h 51m
    <span class="term-green">       _vi,    </span><span class="term-green-bold">`            --+=++++:         </span><span class="term-green-bold"> Packages:</span> 950
    <span class="term-green">      .uvnvi.       </span><span class="term-green-bold">_._       -==+==+.        </span><span class="term-green-bold"> Shell:</span> zsh 5.4.2
    <span class="term-green">     .vvnvnI`    </span><span class="term-green-bold">.;==|==;.     :|=||=|.       </span><span class="term-green-bold"> Resolution:</span> 3840x1080
    <span class="term-gray-bold">+QmQQm</span><span class="term-green">pvvnv; </span><span class="term-gray-bold">_yYsyQQWUUQQQm #QmQ#</span><span class="term-green-bold">:</span><span class="term-gray-bold">QQQWUV$QQmL </span><span class="term-green-bold"> WM:</span> i3
    <span class="term-gray-bold"> -QQWQW</span><span class="term-green">pvvo</span><span class="term-gray-bold">wZ?.wQQQE</span><span class="term-green-bold">==&lt;</span><span class="term-gray-bold">QWWQ/QWQW.QQWW</span><span class="term-green-bold">(: </span><span class="term-gray-bold">jQWQE </span><span class="term-green-bold"> GTK Theme:</span> Adwaita-dark [GTK2/3]
    <span class="term-gray-bold">  -$QQQQmmU'  jQQQ@</span><span class="term-green-bold">+=&lt;</span><span class="term-gray-bold">QWQQ)mQQQ.mQQQC</span><span class="term-green-bold">+;</span><span class="term-gray-bold">jWQQ@' </span><span class="term-green-bold"> Icon Theme:</span> Adwaita
    <span class="term-gray-bold">   -$WQ8Y</span><span class="term-green">nI:   </span><span class="term-gray-bold">QWQQwgQQWV</span><span class="term-green-bold">`</span><span class="term-gray-bold">mWQQ.jQWQQgyyWW@!   </span><span class="term-green-bold"> Terminal Font:</span> Droid Sans Mono 12px
    <span class="term-green">     -1vvnvv.     </span><span class="term-green-bold">`~+++`        ++|+++        </span><span class="term-green-bold"> CPU:</span> Intel Core i7-6700K @ 8x 4.2GHz
    <span class="term-green">      +vnvnnv,                 </span><span class="term-green-bold">`-|===         </span><span class="term-green-bold"> GPU:</span> AMD Radeon RX 480, nVidia GeForce GTX 970
    <span class="term-green">       +vnvnvns.           .      </span><span class="term-green-bold">:=-         </span><span class="term-green-bold"> RAM:</span> 16054MiB
    <span class="term-green">        -Invnvvnsi..___..=sv=.     </span><span class="term-green-bold">`          </span>
    <span class="term-green">          +Invnvnvnnnnnnnnvvnn;.              </span>
    <span class="term-green">            ~|Invnvnvvnvvvnnv}+`              </span><span class="term-gray"> (as of Jan 3rd 2018)</span>
    <span class="term-green">               -~&quot;|{*l}*|&quot;&quot;~                  </span>
</pre>   <!-- yes I changed screenfetch' output a bit -->

I used to maintain [a git repo](https://github.com/darkwater/dotfiles) with my dotfiles, but I've been neglecting it
recently. I've had some ideas about a better system to manage them (primary goals being syncing configs (partially)
between systems, and sharing them with other people) but I don't know when I'll actually set up something new.

- - -

The major components of my desktop environment are:

- [i3](https://i3wm.org/) _(window manager)_  
  Probably the most well known tiling window manager available. I've used bspwm for a while, but that got really messy
  with windows that don't really support tiling, amongst other issues. I'd like to say i3 has better/more sane "default"
  or "fallback" behaviour.

- [obsidian](/projects/obsidian.html) _(bar)_  
  A bar I wrote that shows my workspaces, currently playing music, the time and some other information. Originally
  written for bspwm, later changed to (instead) support i3. Even though workspaces work quite differently between the
  two window managers, I kept the feel of bspwm workspaces. It's one thing I really liked about bspwm over i3.

- [influence](https://github.com/darkwater/influence) _(program launcher)_  
  Enter a command and it runs it through a shell. Also features a list of bookmarks. Far from finished, but it gets the
  job done. I really need to make something good out of this already.

- [st](https://st.suckless.org/) _(terminal emulator)_  
  suckless' simple terminal. Configured by editing the source, may be relatively less friendly to edit common settings
  such as font and colors, but the philosophy makes hacking on the source really easy. Don't want bold fonts? There's no
  option for that, but you can just comment out the part that loads the bold variant of your font.

- [chromium](https://www.chromium.org/) _(web browser)_  
  I browse the web using Chrome. Not much to say here. I've tried Firefox a few times but could never really get used to
  it.

And some other software I use:

- [mpd](https://musicpd.org/) _(music player)_
- [vinyl](/projects/vinyl.html) _(mpd client)_
- [qemu](https://www.qemu.org/) _(virtualization software)_
- zsh _(shell)_
- steam _(game library)_
- pulseaudio _(sound system)_

- - -

I mainly run Linux, but I still like to play games that are only available on Windows, so I have a virtual machine for
that. I pass through an extra GPU and boom, near-native performance videogaming. Even virtual reality games work fine.
