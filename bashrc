# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export PATH=$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$PATH
export EDITOR=vim

alias s='ssh -l root'
alias v='vagrant'
alias dev='cd ~/dev/'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias fool='cd ~/code/thefoolishness && date'
alias v='vagrant'
alias jtv='herbstclient set_monitors 1366x768+0+0 1920x1080+1366+0'

which keychain > /dev/null 2>&1
if [ $? -eq 0 ]; then
    keychain ~/.ssh/id_rsa 2>/dev/null
    . ~/.keychain/$HOSTNAME-sh
    #. ~/.keychain/$HOSTNAME-sh-gpg
fi
