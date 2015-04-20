#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tmux='tmux -2'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:${HOME}/.gem/ruby/2.0.0/bin
#eval "$(rbenv init -)"

alias wow='git status'
alias such='git'
alias very='git'
alias so='git'
alias much='git'

alias publish='python3 -m http.server 8080'
alias fuck="sudo  !!"
alias ffs="sudo  !!"

if [[ $TERM == xterm-termite ]]; then
    TERM=xterm
fi
