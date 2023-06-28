# Qt5ct fix.

I setup my Qt so that it will use Kvantum as it's theme. While I use Kvantum as my theme engine.
However, in order to do that, I have to override the global variable ```QT_QPA_PLATFORMTHEME```.

I ended up finding the file to override that variable: /etc/environment and /etc/profile.
