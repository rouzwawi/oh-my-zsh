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
export PATH=~/bin:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/share/python

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export NODE_HOME=/usr/local/share/npm
export NODE_PATH=$NODE_HOME/lib/node_modules

export PATH=$PATH:/Users/rouz/google-cloud-sdk/bin
export PATH=$PATH:$NODE_HOME/bin:$NPM_HOME/bin
export PATH=~/Library/Haskell/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

export PYTHONPATH="/Users/rouz/code/spotify-common"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/build"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/log-parser"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/luigi"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/hermes-python"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/hermes-proxy"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/statistics/python"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/dnspython"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/remote-control"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/pubsub"
export PYTHONPATH="$PYTHONPATH:/Users/rouz/code/boink/python"

function venv() {
    source ~/code/envs/$1/bin/activate
}

function yq() {
    file=$1 && shift
    js-yaml $file | jq "$@"
}

$(boot2docker shellinit 2> /dev/null)
$(helios-env 2> /dev/null)

# aliases
alias l='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias ..='cd ..'
alias pp='jq .'
alias sb='subl -n'

# local builds
alias vessel='java -jar /Users/rouz/code/vessel/cli/target/vessel-cli-0.1.0-SNAPSHOT-jar-with-dependencies.jar'

# git aliases
alias g='git'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff "HEAD^"'
alias gf='git fetch'
alias gl='git log --graph --oneline --parents --decorate=short'
alias gla='git log --graph --oneline --parents --decorate=short --all'
alias glp='git log --graph --oneline --parents --decorate=short -p'
alias gp='git pull --rebase'
alias gcontrib='git log | grep Auth | sort | uniq -c | sort'
alias gmum='git merge --ff-only upstream/master'
alias gfu='git fetch upstream'
alias gsyn='gfu && gmum'

# git functions
function gpr()  { git fetch origin refs/pull/$1/head  && git checkout FETCH_HEAD }
function gprm() { git fetch origin refs/pull/$1/merge && git checkout FETCH_HEAD }

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function ghclone {
  git clone git@github.com:rouzwawi/$1.git
  cd $1
  git remote add upstream git@github.com:$2/$1.git
  git fetch upstream
  git config user.name "Rouzbeh Delavari"
  git config user.email "rouzwawi@gmail.com"
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


alias wat='head -30 ~/var/me.todo; echo'
