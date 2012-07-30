# If not running interactively, don't do anything
[ -z "$PS1" ] && return

UNAME=`uname -s`

# Source all files in the ~/.bash/ directory
for f in ~/.bash/*; do source $f; done

# Set PS1
case "$TERM" in xterm)
  NOCOLOR="\[\e[m\]"
  CWDCOLOR="\[\e[36m\]"
  PRMTCOLOR="\[\e[32m\]"
  USERCOLOR="\[\e[1;41;37m\]"
  BARCOLOR="\[\e[1;41;31m\]"
esac
TITLE="\[\e]0;\u@\h\a\]"
PS1="${TITLE}${CWDCOLOR}\W${PRMTCOLOR}"
if [[ $(whoami) != "alex" ]]; then
  PS1="${BARCOLOR}(${USERCOLOR}\u${BARCOLOR})${NOCOLOR} ${PS1}"
fi
if [[ $EUID -ne 0 ]]; then
  PS1="${PS1}>"
else
  PS1="${PS1}#"
fi
PS1="${PS1}${NOCOLOR} "


# check the window size after each command
shopt -s checkwinsize

# Add ~/.bin to path
export PATH=~/.bin:$PATH
export PATH=/usr/local/bin:$PATH

function g(){
  cd $* && ls
}

# set bash to VI mode
set -o vi
