- title: Arch Linux
- date: 2015 Nov 16

Here's something that'll keep this blog alive.

I just assembled a new PC to prepare for virtual reality. Got a 970 and an i7 and all that sweet stuff. I also got a
secondary graphics card to set up KVM VGA-Passthrough. However, this is pretty new and very tricky to set up. I don't
think there is "the one guide" that will help you set up everything, so you're basically going to have to read several
guides and blogs to finally get it running.

When realizing this I thought I should consider blogging about that to generate more information for future users to read
and help them set up their VMs, but then immediately I got an even better idea: reinstall Arch and blog about how I use
my system from day 1.

I've been thinking about reinstall Arch anyway. Normally there wouldn't really be a need to do so, sure, even though I've
been running this installation since April 17th 2014. The issue here is that I've certainly solved early problems I had
using ugly hacks which I don't remember anymore. This already inspired me to at least document the things I do to my
system. Might as well take it a step further and maybe give other people ideas on how to do things.

So to begin, let me explain my current situation and set a few goals for my new system, starting with the specs of my new
PC:

    Type               | Product
    ------------------ | -----------------------------------------------------------
    CPU                | Intel Core i7-6700K 4.0GHz Quad-Core
    CPU Cooler         | Cooler Master Hyper 212 EVO 82.9 CFM Sleeve Bearing
    Motherboard        | Asus Z170-A ATX LGA1151
    Memory             | Corsair Vengeance LPX 16GB
    Storage            | Samsung 840 Pro Series 128GB 2.5" Solid State Drive\*
    Storage            | Seagate Barracuda 2TB 3.5" 7200RPM Internal Hard Drive\*
    Video Card         | MSI GeForce GTX 970 4GB Twin Frozr V
    Video Card         | Sapphire Radeon R7 370 2GB Dual-X (for KVM passthrough)
    Case               | NZXT H440 (Matte Black/Red) ATX Mid Tower
    Power Supply       | EVGA SuperNOVA G2 650W 80+ Gold Certified Fully-Modular ATX

<!-- this used to be a table in github markdown format but the current parser doesn't support those -->

\* I kept the storage drives from my previous setup.

Here are some of the things I currently do:

- Use Inbox, Telegram, Google Music, browse reddit, Facepunch and the rest of the internet using Chromium
- Use irssi through my VPS
- Play games on Steam
- Chat/idle on my Mumble server
- Program stuff using Neovim
- Watch anime

And some goals for my new desktop environment:

- Automate a lot of tasks I still do manually every time (autostart/position applications, download and watch anime,
  connect to wireless networks (yes, I still do this on my laptop), etc.)

- Set up Windows gaming on a VM as seamless as possible (Steam In-Home Streaming should help a lot with this)

- Intergrate music using Mopidy or something similar (still using Google Music to keep interoperability with my
  phone/tablet)

- Convieniently display information about my system, server(s) and life (load, temperatures, processes, calendar, todo,
  weather, notifications, etc.)

- Low effort high productivity

- Look awesome

I'll probably end up making a full backup and redoing almost everything, making lots of modifications to my current
dotfiles. I'm not yet sure what I'm going to do on my laptop though. Maybe wait a week or two and then push my changes to
that as well? Maybe reinstall Arch as well? I don't think there's really a reason to do that on my laptop since I've
somehow managed to keep this installation of March 24th 2014 very clean. I don't know.

So that's the plan. Tomorrow I'll be backing up my root and home partitions to my data disk and reinstalling Arch. Stay
tuned!
