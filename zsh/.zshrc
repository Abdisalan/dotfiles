# ZSH
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE=false

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Needed to stow dotfiles
export DOTFILES=$HOME/dotfiles

# Restore pywal settings in new terminal
(cat ~/.cache/wal/sequences &)

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Go
export GOBIN=$(go env GOPATH)/bin
PATH=$PATH:$GOBIN

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
