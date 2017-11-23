- title: Shell magic
- date: 2015 Jun 17

Shells are a wonderful thing. With a single line of code, you can check how many requests have been made to a specific
file on your website, or delete all empty files with a specific extension, or go for something more advance like writing
a utility completely in bash or similar.

Since I started using Linux two and a half years ago, I've always been using the command line interface as much as
possible. It's much faster, more powerful, and more extensible than your average graphical application. In fact, a shell
is kind of like a hub for other applications since you write commands that essentially launch a program to do its work,
and then you're immediately back at your prompt to execute the next command.

It's also technically programming. Or at least, that's what I consider it to be. (I will use zsh from now on as an
example, but almost everything here applies to sh, fish, bash, etc.) Zsh, probably the most popular shell, is just a
programming language. You've got your if statements, while loops, functions, variables, and so on. The major difference
between a shell language and a C-like language is the way things actually happen. In C, you'd interface directly with
the operating system or whatever you want to work with. In zsh, you execute external programs (probably written in C)
that do stuff for you. But that doesn't really matter.

What this means, is that by cd'ing to directories and mv'ing files and whatever you do in a shell, is basically
programming. You can run for loops to move a lot of specifically named files from one place to another. For example,
when developing for Android, you might want to move the white and grey, 24dp and 32dp, calendar and star icons from the
Material Design icons library to your project resources. That would go something like:

    for color in white grey; for size in 24dp 32dp; for name in calendar star
    mv ~/downloads/material_icons/$name-$color-$size.png ~/project/res/drawable/

Of course, you can even shorten that to something like:

    ~/downloads/material_icons/{calendar,star}-{white,grey}-{24dp,32dp}.png ~/project/res/drawable/

That's also not how (sane) Android projects are really structured, but that doesn't matter.

Anyway, I wanted to talk about some shell hacks I've come across while writing scripts the past month or so. First one's
a zsh exclusive, second one works in bash too, and maybe even sh.

Multiple fd redirects!
----------------------

Imagine a pipeline. Now turn that line into a tree.

    command \
    1>>(
        grep 'stdout goes through here' | \
        xclip \
    ) \
    2>>(
        grep 'stderr goes through here' | \
        dzen2 \
    )

That's right! The output of `command` gets split up. In bash, you can already do something like `command 1>out.txt
2>err.txt`, but in zsh, you can even pipe them to a subshell! Thanks to this, I was able to add a progress bar to [my
screenshot upload tool][screentool].

Command output streams as argument
----------------------------------

Here's a similar one. You might know you can run a command in a subshell, and use its output as an argument for another
command, like `echo $(echo hello world)`. Now, what if you're dealing with a lot more output? What if you want to, say,
diff two diffs? (Yes, that's straight out of a Destroy All Software screencast.) Or, as a little more sane example,
compare the contents of two directories? Easy.

    diff <(ls one-folder) <(ls other-folder)

You can replace diff with echo to see what this really does. It basically just makes a new file descriptor and tells the
program to use that instead of a normal file.

Networking
----------

So here's a nice bash feature. (Note: AFAIK it only works in bash, so no zsh or sh.) You can open TCP and UDP
connections using bash as if they're files, using /dev/_tcp_/_127.0.0.1_/_80_. (Obviously replace protocol/ip/port with
whatever you need.) They can only be opened as files, like `uname -a > /dev/tcp/127.0.0.1/1234`, (most) other programs
won't recognize it because it's not actually a file (or a device or whatever) in /dev/,  it's actually something that
bash understands and intercepts. So no catting them directly. (Like `cat /dev/tcp/127.0.0.1/22`, but you *can* do `cat <
/dev/tcp/127.0.0.1/22`)

Shell scripting
---------------

You can improve your workspace a lot using those. If you find yourself often doing the same thing over and over again,
put them in a shell script. It's almost the same as running those commands yourself, and it will (probably) save you a
lot of time.


Not sure what else I wanted to talk about when I started writing this (6 days ago), but I guess that's just how it goes
now. Please don't expect any of my posts in the past, present or future to make sense. Thanks, and fly safe.

PS: I made a footnote linking to my dotfiles but I have no idea where I wanted to put it, so [here][dotfiles] you go, in
case you haven't seen them yet.


[screentool]: https://github.com/Darkwater/dotfiles/blob/master/bin/screentool
[dotfiles]: https://github.com/Darkwater/dotfiles
