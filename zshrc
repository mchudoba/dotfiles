# Path to your oh-my-zsh installation.
export ZSH=$HOME/dev/oh-my-zsh

# Set default editor to Vim
export EDITOR="vim"

# Java environment setup
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Python user packages (pip install --user)
export PATH="$HOME/.local/bin:$PATH"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

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
[ -f ~/.env ] && source ~/.env

unsetopt correct
#unsetopt autocd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM setup and bash completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
fi

# Virtualenv wrapper
function venv { source "$1"/bin/activate }

# Require virtualenv to install Pip packages
export PIP_REQUIRE_VIRTUALENV=true

# Custom aliases

alias c="clear"
alias sl="ls"
alias lsa="ls -lah"
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
alias t="tmux a -t ias"

# ZSH plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ctrl+Space to accept current auto suggestion
bindkey '^ ' autosuggest-accept
