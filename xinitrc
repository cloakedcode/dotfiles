[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

exec "$@"
