# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### Environment
# PATH is built in ~/.zprofile — it has to run after /etc/zprofile's path_helper.

export CLICOLOR=1                      # colorized ls

##### Options and keys

unsetopt BEEP                          # /etc/zshrc turns it on

# EDITOR contains "vi", which would otherwise get us vi keybindings.
bindkey -e

##### History

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
# SHARE_HISTORY also gives us incremental appends and timestamped entries.
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

##### Completion

[[ -d ~/.docker/completions ]] && fpath=(~/.docker/completions $fpath)

# Keep the dump out of $HOME. compinit rebuilds it when the number of completion
# files changes; `compinit -C` skips that check and misses new completions.
_zdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zdump:h}"
autoload -Uz compinit && compinit -d "$_zdump"
unset _zdump

# Exact match first, case-insensitive only if that finds nothing.
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu no                              # fzf-tab replaces the menu
zstyle ':completion:*' special-dirs true                    # complete ../ and ./
zstyle ':completion:*:descriptions' format '[%d]'           # fzf-tab groups by these
zstyle ':completion:*:git-checkout:*' sort false            # keep git's order, not alphabetical

##### Tools

# Source a file only if it's readable.
_src() { [[ -r $1 ]] && source $1 }

# fzf: Ctrl-R history, Ctrl-T file paths, Alt-C cd.
# The widgets don't read FZF_DEFAULT_COMMAND, so fd has to be wired into each
# one; left unset they fall back to fzf's own walker, which ignores .gitignore.
# ctrl-/ otherwise toggles result-list wrapping — a fair trade. Not ctrl-p:
# that's fzf's up-match. Preview scrolling is shift-up/shift-down by default.
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border --bind ctrl-/:toggle-preview'

# --strip-cwd-prefix drops the leading ./ from every result.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --strip-cwd-prefix'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="
  --preview 'eza --tree --color=always {} | head -200'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Ctrl-Y copies the command to the clipboard'"
command -v fzf >/dev/null && source <(fzf --zsh)

# zoxide: `z <substring>` jumps to a frecent directory, `zi` picks interactively
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

##### Aliases

alias c="clear"
alias ls="eza --group-directories-first"
alias lsa="eza -lah --git --group-directories-first"
alias lt="eza --tree --level=2"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gp="git pull"
alias gl="git log"
alias glo="git log --oneline"
alias gc="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias dc="docker compose"

##### Plugins

# fzf-tab must load after compinit and before anything that wraps ZLE widgets.
_src /opt/homebrew/share/fzf-tab/fzf-tab.zsh
# fzf-tab runs previews without a tty, so auto-detection turns color off; force it on.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'   # move between [groups] from the descriptions format
# fzf-tab ignores FZF_DEFAULT_OPTS. It can be told to honor it, but some flags
# break the completion popup, so pass the safe ones through explicitly instead.
zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse
zstyle ':fzf-tab:*' fzf-min-height 15

_src /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept        # Ctrl+Space accepts the suggestion

##### Prompt (powerlevel10k)

_src /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##### Syntax highlighting

# Sourced last: its hook has to register after anything else that modifies the
# command-line buffer, which zsh-autosuggestions does.
_src /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
unset -f _src

##### Machine-local / work config (not tracked in dotfiles)

# Sourced below the instant prompt block, so nothing here may read from the
# console: p10k points stdin at /dev/null until the real prompt takes over.
# Anything that asks for input (ssh-add, a keyring unlock) belongs above it.
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
