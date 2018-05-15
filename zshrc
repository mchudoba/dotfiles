# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/oh-my-zsh

export PATH=~/Library/Python/3.6/bin:$PATH

# Set default editor to Vim
export EDITOR="vim"

# Java environment setup
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Use mysql 5.6
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="matt"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew, mvn)

source $ZSH/oh-my-zsh.sh
source ~/.vivid_env

unsetopt correct

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom aliases

alias c="clear"
alias sl="ls"
alias lsa="ls -a"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gp="git pull"
alias gl="git log"
alias glo="git log --oneline"
alias gc="git checkout"
alias gcl="git checkout @{-1}"
alias gcs="git checkout stage"
alias gb="git branch"
alias gba="git branch -a"
alias r="rails"
alias mc="mvn clean"
alias mi="mvn install -Dmaven.test.skip"
alias mit="mvn install"
alias mci="mvn clean install -Dmaven.test.skip && c"
alias mcit="mvn clean install && c"
alias mcic="mvn clean install -Dmaven.test.skip"
alias mcitc="mvn clean install"
alias mci-web="mvn -f ~/VividSeats/vivid-coreapi clean install -Dmaven.test.skip && mvn -f ~/VividSeats/vivid-web clean install -Dmaven.test.skip"
alias mcit-web="mvn -f ~/VividSeats/vivid-coreapi clean install && mvn -f ~/VividSeats/vivid-web clean install"
alias web="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install -Dmaven.test.skip && cd ~/VividSeats/vivid-web && mvn clean install -Dmaven.test.skip && cd \$cwd"
alias tfs="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install -Dmaven.test.skip && cd ~/VividSeats/tfs-web && mvn clean install -Dmaven.test.skip && cd \$cwd"
alias ws="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install -Dmaven.test.skip && cd ~/VividSeats/vivid-web-services && mvn clean install -Dmaven.test.skip && cd \$cwd"
alias sales="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install -Dmaven.test.skip && cd ~/VividSeats/vivid-sales && mvn clean install -Dmaven.test.skip && cd \$cwd"
alias web-test="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install && cd ~/VividSeats/vivid-web && mvn clean install && cd \$cwd"
alias tfs-test="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install && cd ~/VividSeats/tfs-web && mvn clean install && cd \$cwd"
alias ws-test="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install && cd ~/VividSeats/vivid-web-services && mvn clean install && cd \$cwd"
alias sales-test="export cwd=\$(pwd) && cd ~/VividSeats/vivid-coreapi && mvn clean install && cd ~/VividSeats/vivid-sales && mvn clean install && cd \$cwd"
alias t="tmux a -t vivid"

