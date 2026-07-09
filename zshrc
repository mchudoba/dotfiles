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
# fzf-tab replaces the completion menu; zsh's own menu must stay out of its way.
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'           # fzf-tab groups by these
zstyle ':completion:*:git-checkout:*' sort false            # keep git's order, not alphabetical

##### Tools

# fzf: Ctrl-R history, Ctrl-T file paths, Alt-C cd.
# The widgets each overwrite FZF_DEFAULT_COMMAND with their own *_COMMAND before
# running, so setting only FZF_DEFAULT_COMMAND would not reach them; it applies
# to a bare `fzf`. Unset, the widgets use fzf's built-in walker, which knows
# nothing about .gitignore — hence fd, which honors it inside a repo and
# ~/.config/fd/ignore everywhere else.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="
  --preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Ctrl-Y copies the command to the clipboard'"
source <(fzf --zsh)

# zoxide: `z <substring>` jumps to a frecent directory, `zi` picks interactively
eval "$(zoxide init zsh)"

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

# fzf-tab must load after compinit and before anything that wraps ZLE widgets.
source /opt/homebrew/share/fzf-tab/fzf-tab.zsh
# BSD ls: -G colors, CLICOLOR_FORCE keeps it colored when not a tty.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'CLICOLOR_FORCE=1 ls -1G $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'   # move between [groups] from the descriptions format

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept        # Ctrl+Space accepts the suggestion

##### Prompt (powerlevel10k)

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##### Machine-local / work config (not tracked in dotfiles)

[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
