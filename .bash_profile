case $- in
    *i*) ;;
      *) return;;
esac

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

alias mkdir='mkdir -p'
alias dirs='dirs -v'
alias ls='ls -lG'
alias grep='grep'
alias pop='popd'
alias push='pushd'
alias tmux='tmux -2'
alias rm='rm -i'

if test -t 1 ; then
  ncolors=$(tput colors)
  if test -n "$ncolors" && test $ncolors -ge 8; then
    export rl_cyan='\001\e[96m\002'
    export rl_yellow='\001\e[93m\002'
    export rl_green='\001\e[32m\002'
    export rl_reset='\001\e[0m\002'
  fi
fi
export PROMPT_COMMAND='echo -ne "\033]0;${USER}.${osver}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
export PS1="${rl_cyan}${USER}.${osver}${rl_reset}@${rl_yellow}\\h${rl_reset}:${rl_green}\\w${rl_reset}\\$ "
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH=/opt/bin:~/.local/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/Library/Python/3.7/bin/:$PATH
complete -C '~/Library/Python/3.7/bin/aws_completer' aws
export PATH="/usr/local/opt/ruby/bin:$PATH"
alias config='/usr/bin/git --git-dir=/Users/thomas/.cfg/ --work-tree=/Users/thomas'
