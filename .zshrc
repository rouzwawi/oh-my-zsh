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
export ANDROID_HOME=/Users/rouz/.vulcan/cache/android-sdk-r25.1.7-spotify5-macosx.zip-ef7b29fac9c7195ba2c0d3e9e8e4651091150d03/extracted/sdk

export NODE_HOME=/usr/local/share/npm
export NODE_PATH=$NODE_HOME/lib/node_modules

export RUST_SRC_PATH=/usr/local/src/rust/src
export RUST_HOME=/Users/rouz/.cargo/bin

export PATH=$PATH:/Users/rouz/google-cloud-sdk/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$RUST_HOME:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function venv() {
    source ~/code/envs/$1/bin/activate
}

function yq() {
    file=$1 && shift
    js-yaml $file | jq "$@"
}

. /usr/local/etc/profile.d/z.sh
eval "$(docker-machine env dev)"
eval "$(helios-env 2> /dev/null)"

# aliases
alias l='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias ..='cd ..'
alias pp='jq .'
alias sb='subl -n'
alias spm='npm -reg http://npm-registry.spotify.net'

# local builds
alias vessel='java -jar /Users/rouz/code/vessel/cli/target/vessel-cli-0.1.0-SNAPSHOT-jar-with-dependencies.jar'

# git aliases
export GIT_FORMAT='%C(auto)%h %Cblue[%an]%Creset%C(auto)%d %s'
alias g='git'
alias gc='git commit'
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

# Maven with open source settings
alias mvno='mvn -s ~/.m2/settings-open.xml'

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

# Add ssh keys to agent
ssh-add -A

# fun
alias skont='say shoun; sleep 0.7; say ttte'
alias smejka='say vill doo smayca litee\?'


alias wat='head -30 ~/var/me.todo; echo'

# The next line updates PATH for the Google Cloud SDK.
source '/Users/rouz/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/rouz/google-cloud-sdk/completion.zsh.inc'
