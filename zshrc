# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### Environment

export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin"   # pipx, pip install --user
export PATH="$PATH:$HOME/go/bin"       # Go binaries
export CLICOLOR=1                      # colorized ls

##### Options

unsetopt autocd                         # don't cd just by typing a directory name

##### History

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

##### Completion

[[ -d ~/.docker/completions ]] && fpath=(~/.docker/completions $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' menu select

##### Tools

# uv completions
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##### Aliases

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
alias gb="git branch"
alias gba="git branch -a"
alias tf="terraform"
alias dc="docker compose"

##### Plugins

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept        # Ctrl+Space accepts the suggestion

##### Prompt (powerlevel10k)

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##### Machine-local / work config (not tracked in dotfiles)

[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
