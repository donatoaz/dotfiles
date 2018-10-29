# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools/"

# Path to your oh-my-zsh installation.
export ZSH=/Users/donato/.oh-my-zsh
export NPM_TOKEN=4a754e0d-a042-4a47-a8f8-68986c83fb82

POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram)
# other options for elements: node_version rvm 

# only show current directyory name instead of full path from home
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_SHORTEN_DELIMITER=""

# add a new line before each new prompt
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

DEFAULT_USER=donato

# completion options
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-autosuggestions zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ruby colorls
source $(dirname $(gem which colorls))/tab_complete.sh

alias lc='colorls -A'
alias tree='colorls -A --tree'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

function cpplugaapp(){ cp .pluga_app_script ../../pluga-api/app_scripts/$(basename $PWD) }

# my git aliases
alias glod='git log --oneline --decorate'

eval "$(direnv hook zsh)"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

function indocker(){
  if [ -z "$1" ]; then
    exit 0;
  else
    if [ -z "$2" ]; then
      docker exec -ti --env COLUMNS=`tput cols` --env LINES=`tput lines` $1 /bin/bash 
    else
      docker exec -ti --env COLUMNS=`tput cols` --env LINES=`tput lines` $1 $2
    fi
  fi
}

alias dcup='docker-compose up'
alias dcupf='docker-compose up --force-recreate'
alias dcr='docker-compose restart'
alias dcs='docker-compose stop'
alias dcrm='rm tmp/pids/server.pid && dcs api && dcupf api'

alias finadb='docker exec -ti --env COLUMNS=`tput cols` --env LINES=`tput lines` fina_db_1 psql -U fina -d finabd'
alias finadb_staging='docker exec -ti --env COLUMNS=`tput cols` --env LINES=`tput lines` fina_db_1 psql -U fina -d finabd -h 104.236.80.0'

alias glogc='git log --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s"'
ctags=/usr/local/bin/ctags
