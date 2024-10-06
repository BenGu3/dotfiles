#-----------------------------------------
# oh-my-zsh
#-----------------------------------------
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  docker
  docker-compose
  yarn
  npm
  nvm
  kubectl
  helm
  fzf
  fzf-tab
  golang
)

zstyle ':omz:plugins:nvm' autoload true

#-----------------------------------------
# spaceship prompt
# from https://github.com/denysdovhan/spaceship-prompt
#-----------------------------------------
ZSH_THEME="spaceship" 
# SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  # kubectl       # Kubectl context section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

source $ZSH/oh-my-zsh.sh

#-----------------------------------------
# tab title
#-----------------------------------------
DISABLE_AUTO_TITLE="true"
function title {
  echo -e "\033];$@\007"
}
title ${PWD/#$HOME/'~'}
function chpwd() {
  title ${PWD/#$HOME/'~'}
}

#-----------------------------------------
# aliases
#-----------------------------------------
alias e="nvim"
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

#-----------------------------------------
# aliases - personal
#-----------------------------------------
alias learn="cd ~/repos/personal/learnings"
alias school='cd ~/repos/school'
alias personal='cd ~/repos/personal'

#-----------------------------------------
# aliases - work
#-----------------------------------------
alias dev='cd ~/repos/work'

#-----------------------------------------
# nvm
#-----------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#-----------------------------------------
# fzf
#-----------------------------------------
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
enable-fzf-tab

#-----------------------------------------
# fzf
#-----------------------------------------
zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit && compinit

#-----------------------------------------
# nvim/zellij
#-----------------------------------------
if [[ "$TERM" == "alacritty" && -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij -l welcome
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

