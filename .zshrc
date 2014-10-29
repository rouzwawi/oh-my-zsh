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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export GOPATH=~/.gocode

export NODE_HOME=/usr/local/Cellar/node/0.10.30

export ARD_TOOLS=/Applications/Arduino.app/Contents/Resources/Java/hardware/tools

export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=/usr/texbin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=~/bin:$PATH

export DOCKER_HOST=tcp://192.168.59.103:2375

export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

source ~/code/resty/resty

# aliases
alias l='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias ..='cd ..'
alias pp='jq .'
alias sb='subl -n'

alias gowork='export GOPATH=`pwd`'

# git aliases
alias g='git'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD^'
alias gf='git fetch'
alias gl='git log --graph --oneline --parents --decorate=short'
alias gla='git log --graph --oneline --parents --decorate=short --all'
alias glp='git log --graph --oneline --parents --decorate=short -p'
alias gp='git pull --rebase'
alias gmum='git merge upstream/master'
alias gfu='git fetch upstream'

# git functions
function gpr()  { git fetch origin refs/pull/$1/head  && git checkout FETCH_HEAD }
function gprm() { git fetch origin refs/pull/$1/merge && git checkout FETCH_HEAD }

function ghclone {
  git clone git@github.com:rouzwawi/$1.git
  cd $1
  git remote add upstream git@github.com:$2/$1.git
  git fetch upstream
}

function gheclone {
  git clone git@ghe.spotify.net:rouz/$1.git
  cd $1
  git remote add upstream git@ghe.spotify.net:$2/$1.git
  git fetch upstream
}

# fun
alias skont='say shoun; sleep 0.7; say ttte'
alias smejka='say vill doo smayca litee\?'


alias wat='cat ~/var/me.todo'
