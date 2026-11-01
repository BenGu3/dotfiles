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
  pnpm
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
alias ez="cd ~ && e .zshrc"
alias ec="cd ~/.config && e ."
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias lg='lazygit'
alias o="opencode"

#-----------------------------------------
# aliases - personal
#-----------------------------------------
alias personal='cd ~/repos/personal'

#-----------------------------------------
# aliases - work
#-----------------------------------------
alias dev='cd ~/repos/work'

#-----------------------------------------
# brew
#-----------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

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
zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit && compinit

#-----------------------------------------
# nvim
#-----------------------------------------
export EDITOR=nvim

# ----------------------------------------
# k9s
# ----------------------------------------
export K9S_CONFIG_DIR="$HOME/.config/k9s"


# ----------------------------------------
# pnpm
# ----------------------------------------
export PNPM_HOME="/Users/benguthrie/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

## ----------------------------------------
## bun completions
# ----------------------------------------
[ -s "/Users/benguthrie/.bun/_bun" ] && source "/Users/benguthrie/.bun/_bun"

# ----------------------------------------
# bun
# ----------------------------------------
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ----------------------------------------
# go
# ----------------------------------------
export PATH=$PATH:$(go env GOPATH)/bin

# ----------------------------------------
# lazy git config
# ----------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"

