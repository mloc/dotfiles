#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export PATH=$PATH:${HOME}/.gem/ruby/2.0.0/bin
#eval "$(rbenv init -)"

alias fuck="sudo  !!"
alias ffs="sudo  !!"

if [[ $TERM == xterm-termite ]]; then
    TERM=xterm
fi
source ~/.commonrc
