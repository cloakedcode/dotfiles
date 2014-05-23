xrandr --output VGA-0 --left-of DVI-I-1

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

/usr/bin/xscreensaver -no-splash &

exec awesome
