#-----------------------------------------
# oh-my-zsh
#-----------------------------------------
export ZSH="/Users/ben-guthrie/.oh-my-zsh"

plugins=(
  git
  docker
  docker-compose
  yarn
  npm
  nvm
  kubectl
  helm
  poetry
  fzf
  fzf-tab
)
NVM_AUTOLOAD=1

#-----------------------------------------
# spaceship prompt
# from https://github.com/denysdovhan/spaceship-prompt
#-----------------------------------------
ZSH_THEME="spaceship" 
SPACESHIP_KUBECTL_SHOW=false
SPACESHIP_TIME_12HR=true
SPACESHIP_BATTERY_THRESHOLD=101
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  pyenv         # Pyenv section
  kubectl       # Kubectl context section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  battery
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
# aliases - personal
#-----------------------------------------
alias learn="cd /Users/ben-guthrie/repos/personal/learnings"
alias school='cd /Users/ben-guthrie/repos/personal/school'

alias ws="webstorm"
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

#-----------------------------------------
# aliases - work
#-----------------------------------------
alias dev='cd ~/repos/work'
alias chan='cd ~/repos/work/channels'
alias iq='cd ~/repos/work/roleiq-leader'
alias curation='cd ~/repos/work/curation'

#-----------------------------------------
# nvm
#-----------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#-----------------------------------------
# pyenv
#-----------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

#-----------------------------------------
# poetry
#-----------------------------------------
export PATH="/Users/ben-guthrie/.local/bin:$PATH"

#-----------------------------------------
# zscaler
#-----------------------------------------
export NODE_EXTRA_CA_CERTS=/Users/ben-guthrie/repos/work/ZscalerRootCertificate-2048-SHA256.crt

#-----------------------------------------
# fzf
#-----------------------------------------
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
enable-fzf-tab
