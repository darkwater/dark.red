- title: Initialization
- date: 2015 Nov 18

I spent way too much time on installing Arch. I went to read the Beginners' Guide as if I was a newcomer. Things tend to
change over time so maybe there were things I didn't know yet. Of course, the Beginners' Guide is on a wiki which meant
it took at least an hour or two before I got to partitioning my disks due to branching off to all the other wiki pages.

So then I mostly followed the Beginners' Guide like you'd normally do. Here are most of the decisions I made during the
installation process:

- I've got two disks: a HDD and a SSD. My HDD contains my /data directory, and old Windows 7 partition (which I'll be
  making obsolete soon) and my old 4G /var directory, which I also won't be using anymore. I think I initially did that
  because I read somewhere that /var would be accessed very often and thus wear down SSDs. Right now I'd think "why even
  use SSDs then? They're fast" and didn't even think about re-using that partition. Anyway, I didn't really touch my HDD
  at all.

  On my SSD however, I just went with a small boot partition for EFI booting and filled the rest with a partition for my
  root, home, and really just everything aside from /data and /boot. I then put btrfs on it. Why not ext4? Because btrfs
  is cool and ext4 is boring. (I really don't know, just felt like it.)

- Set up systemd-boot because I'm not a huge anti-systemd "muh freedom" nerd (jokes/no offense, I just don't really care
  that much) and figured I'd give the entire toolchain a shot. It's like that time I went back to pulse. Except I
  immediately regretted doing that. Will the same happen here again? We'll see.

- Installation. `mount /dev/sda2 /mnt && pacstrap -i /mnt base base-devel zsh neovim`. Realize I forgot to mount /boot
  which is now separate so `cd /mnt && mv boot asdf && mkdir boot && mount /dev/sda1 boot && mv asdf/* boot/ && rmdir
  asdf`

- Mount /data, generate /etc/fstab, unmount /data because I really don't want to touch it just yet, chroot in, `ln -s
  /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime`, `bootctl install`, install intel-ucode, make a boot entry, set
  static IP, all that stuff. Mess up some things, fix them, no big deal.

Time to reboot! This is where the fun starts. Set up my user, git clone my dotfiles, install X, bspwm, sxhkd and all the
other dependencies, finally write a script that automates linking everything, install rxvt-unicode, chromium, steam,
mumble, and this is about where I started doing at least 5 things at once. I'm back in the DE modding scene!

Immediately started making some minor modifications. Before reinstalling I'd downloaded a small-ish set of wallpapers
which I'm going to rotate automatically on boot or something, copy those over from my backup and randomly set them
(temporarily for now, using a feh one-liner). Increase window gap to 25 to make them a bit more visible. Also increate
panel height to 5px for now because I felt like it. I'll write a new one, anyway. Disable transparency in urxvt because
(most of) my backgrounds aren't dark anymore. Play around with it for a bit, figure out how to spawn a fully transparent
terminal (easy; just `bspc rule -a \* -o border=off; urxvt -tr`). At this point my desktop looks like this:

![It's the same except slightly different!](http://novaember.com/s/8f9453/vXwB9M.png)

Most of it's still uncommitted, but I'm getting somewhere. In the following couple of days I'll likely be making a new
panel, changing my Neovim config and terminal colors, maybe even setting up Mopidy already.

This is gonna be fun!
