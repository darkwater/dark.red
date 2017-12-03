- title: New tab page
- cover: /static/newtab-cover.png
- category: ongoing

An alternative new tab page for Chrome. It uses bookmarks for the links, so to add a link you just add a bookmark in a
specific folder.

GitHub: [dark-newtab](https://github.com/darkwater/dark-newtab) &middot;
Tech used: Javascript (ES6)

- - -

The background is supposed to make it look like the page is transparent, showing the desktop wallpaper. It's loaded from
http://localhost/dark-newtab/bg-full.png. The page actually loads bg-small.png in the same directory first, which should
be a smaller version of the same image. Otherwise the page would flash black because a 3840x1080 image takes a couple of
frames to fully load and render.

![Fullscreen screenshot](/static/newtab-fullscreen.png)

- - -

The colors are obtained using [Vibrant.js](https://jariz.github.io/vibrant.js/) on the favicon (and cached in local
storage). The links themselves are loaded in from a bookmarks folder:

    Other bookmarks
     -  New Tab
         -  Social
             -  Reddit
             -  Facepunch
             -  YouTube
             -  ...
         -  Webcomics
             -  xkcd
             -  Oglaf
             -  ...
         -  ...

![A closeup of some of the links](/static/newtab-closeup.png)

- - -

If you press Tab once from the address bar, you can open a link by typing two letters based on its position.

![Link hints](/static/newtab-keyboard.png)
