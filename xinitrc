#!/usr/bin/env bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

if [[ $(hostname) == "twinkle" ]]; then
    numlockx off
else
    numlockx on
fi

# fonts
{
    # reset font path
    xset fp

    for font in /usr/share/fonts/*/fonts.dir; do
        dir=$(dirname "${font}")
        # remove first just in case X loaded it by default
        # we don't want paths included twice
        xset -fp "${dir}" >/dev/null 2>&1
        xset +fp "${dir}"
    done

    xset fp rehash
}

# autostart
{
    redshift -l geoclue2 -m randr &

    xautolock -time 2 -locker sflock -corners +000 -cornerdelay 3 &
    $HOME/bin/nm-applet-fix.sh &

    sxhkd &
}

exec xfce4-session
