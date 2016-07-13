#!/usr/bin/env bash

##
# The following is copied from /etc/xdg/xfce4/xinitrc
# of a default XFCE4 install.
#
# {
##

# fix broken $UID on some system...
if test "x$UID" = "x"; then
  if test -x /usr/xpg4/bin/id; then
    UID=`/usr/xpg4/bin/id -u`;
  else
    UID=`id -u`;
  fi
fi
# set $XDG_MENU_PREFIX to "xfce-" so that "xfce-applications.menu" is picked
# over "applications.menu" in all Xfce applications.
if [[ "x$XDG_MENU_PREFIX" == "x" ]];  then
  XDG_MENU_PREFIX="xfce-"
  export XDG_MENU_PREFIX
fi

# set DESKTOP_SESSION so that one can detect easily if an Xfce session is running
if [[ "x$XDG_DESKTOP_SESSION" == "x" ]];  then
  DESKTOP_SESSION="xfce"
  export DESKTOP_SESSION
fi

# set XDG_CURRENT_DESKTOP so that Qt 5 applications can identify user set Xfce theme
if [[ "x$XDG_CURRENT_DESKTOP" == "x" ]];  then
  XDG_CURRENT_DESKTOP="XFCE"
  export XDG_CURRENT_DESKTOP
fi

# $XDG_CONFIG_HOME defines the base directory relative to which user specific
# configuration files should be stored. If $XDG_CONFIG_HOME is either not set
# or empty, a default equal to $HOME/.config should be used.
if [[ "x$XDG_CONFIG_HOME" == "x" ]];  then
  XDG_CONFIG_HOME=$HOME/.config
fi
[ -d "$XDG_CONFIG_HOME" ] || mkdir "$XDG_CONFIG_HOME"

# $XDG_CACHE_HOME defines the base directory relative to which user specific
# non-essential data files should be stored. If $XDG_CACHE_HOME is either not
# set or empty, a default equal to $HOME/.cache should be used.
if [[ "x$XDG_CACHE_HOME" == "x" ]]; then
  XDG_CACHE_HOME=$HOME/.cache
fi
[ -d "$XDG_CACHE_HOME" ] || mkdir "$XDG_CACHE_HOME"

# set up XDG user directores.  see
# http://freedesktop.org/wiki/Software/xdg-user-dirs
if which xdg-user-dirs-update >/dev/null 2>&1; then
    xdg-user-dirs-update
fi

# Modify libglade and glade environment variables so that
# it will find the files installed by Xfce
GLADE_CATALOG_PATH="$GLADE_CATALOG_PATH:"
GLADE_PIXMAP_PATH="$GLADE_PIXMAP_PATH:"
GLADE_MODULE_PATH="$GLADE_MODULE_PATH:"
export GLADE_CATALOG_PATH
export GLADE_PIXMAP_PATH
export GLADE_MODULE_PATH

# Has to go prior to merging Xft.xrdb, as its the "Defaults" file
[[ -f "/etc/xdg/xfce4/Xft.xrdb" ]] && xrdb -merge "/etc/xdg/xfce4/Xft.xrdb"

##
# } end xfce4 xinitrc
##

[[ -f ~/bin/generate_xres.sh ]] && ~/bin/generate_xres.sh
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

if [[ $(hostname) == "twinkle" ]]; then
    numlockx off

    xrandr --output eDP1 --primary
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
    redshift -l 40:-80 -m randr &

    xautolock -time 5 -locker /home/smith/bin/locker &
    unclutter -root -idle 3 &

    sxhkd &

    /home/smith/.config/i3/wp_change

    #$HOME/.config/herbstluftwm/panel/panel &
}

if which ck-launch-session >/dev/null 2>&1; then
  ck-launch-session xfce4-session
else
  echo
  echo "You have tried to start Xfce with consolekit support, but"
  echo "ck-launch-session is not installed."
  echo "Aborted startup..."
  echo

  exit 1
fi
