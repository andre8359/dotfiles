#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##### set vim mode
set -o vi


##### alias section ####

alias ls='ls --color=auto'
alias psg='ps aux|grep'
alias rdesktop='rdesktop -k pt-br -g 1900x1000'
alias vim='nvim'
alias vi='nvim'
alias oldvim='\vim'

#### Export stuff ####
export SVC_DEPS=/vmshare/svc/svc.ext
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
TMOUT=0
readonly TMOUT
export TMOUT

#### PS1 ####
RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
SMILEY="${WHITE}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

PS1="${RESET}[${RED}\u${NORMAL}@${RED}ABELHA2615${NORMAL}] \W ${YELLOW}(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))${NORMAL} \` ${SELECT}\` \$ "


source ~/env/bin/activate
