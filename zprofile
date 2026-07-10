# Login shells. Runs after /etc/zprofile, which calls path_helper and rewrites
# PATH — so PATH must be built here, not in .zshenv, or path_helper reorders it.

eval "$(/opt/homebrew/bin/brew shellenv)"

# Tied to $PATH. -U drops duplicates, keeping the leftmost, so re-sourcing this
# file doesn't grow PATH. Prepended: our binaries shadow the system's.
typeset -U path
path=("$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin" $path)

##### Machine-local (not tracked in dotfiles)

[[ ! -f ~/.zprofile.local ]] || source ~/.zprofile.local
