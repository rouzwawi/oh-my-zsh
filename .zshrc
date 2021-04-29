# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="rouz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:$PATH:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

function swjava {
  export JAVA_HOME=`/usr/libexec/java_home -v $1`
}
swjava 11

export NODE_HOME=/usr/local/share/npm
export NODE_PATH=$NODE_HOME/lib/node_modules

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export RUST_SRC_PATH=/usr/local/src/rust/src
export RUST_HOME=/Users/rouz/.cargo/bin

export GOPATH=~/go

export PATH=$GOPATH/bin:$PATH
export PATH=$RUST_HOME:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/Library/Python/3.7/bin"

function venv() {
    source $1/bin/activate
}

# aliases
alias l='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias ..='cd ..'
alias pp='jq .'
alias spm='npm -reg http://npm-registry.spotify.net'

# git aliases
export GIT_FORMAT='%C(auto)%h %Cblue[%an]%Creset%C(auto)%d %s'
alias g='git'
alias gc='git commit -S'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff "HEAD^"'
alias gf='git fetch'
alias gl='git log --graph --pretty=format:"$GIT_FORMAT"'
alias gla='git log --graph --pretty=format:"$GIT_FORMAT" --all'
alias glp='git log --graph --pretty=format:"$GIT_FORMAT" -p'
alias gp='git pull --rebase'
alias gcontrib='git log | grep Auth | sort | uniq -c | sort'
alias gmum='git merge --ff-only upstream/master'
alias gfu='git fetch upstream'
alias gsyn='gfu && gmum'

# git functions
function gpr()  { git fetch origin refs/pull/$1/head  && git checkout FETCH_HEAD }
function gprm() { git fetch origin refs/pull/$1/merge && git checkout FETCH_HEAD }

# activate venv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# kubectl
alias kb='kubectl'

export GPG_TTY=$(tty)

function burk {
  host=$(burklee | fzf)
  [[ ! -z "$host" ]] && ssh -A "$host.spotify.net"
}

# fun
alias skont='say shoun; sleep 0.7; say ttte'
alias smejka='say vill doo smayca litee\?'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rouz/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rouz/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rouz/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rouz/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
