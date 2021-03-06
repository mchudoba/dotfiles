# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Set default editor to Vim
export EDITOR="vim"

# Java environment setup
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Python user packages (pip install --user)
export PATH="$HOME/.local/bin:$PATH"

# Use mysql 5.6
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="matt"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(brew, mvn)

source $ZSH/oh-my-zsh.sh
[ -f ~/.vivid_env ] && source ~/.vivid_env

unsetopt correct
#unsetopt autocd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM setup and bash completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

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

# ZSH plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ctrl+Space to accept current auto suggestion
bindkey '^ ' autosuggest-accept
