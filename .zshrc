# ZSH
export ZSH="/Users/Abdi/.oh-my-zsh"
export ZSH_THEME="spaceship"
plugins=(git)
source $ZSH/oh-my-zsh.sh

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
