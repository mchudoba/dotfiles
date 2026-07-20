#!/bin/bash
# Symlink dotfiles into $HOME and set up a new machine.
# Safe to re-run: existing real files are backed up to <file>.bak once.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
GITDIR="$CONFIG/git"

if [[ -e "$HOME/.gitconfig" ]]; then
  echo "WARNING: ~/.gitconfig takes precedence over ~/.config/git/config — fold it in and delete it"
fi

link() {
  local src="$DOTFILES/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  # Back up a pre-existing real file/dir (not one of our symlinks).
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "backing up $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest"
}

# Shell
link zshenv           "$HOME/.zshenv"
link zshrc            "$HOME/.zshrc"
link zprofile         "$HOME/.zprofile"
link p10k.zsh         "$HOME/.p10k.zsh"

# Git
link gitconfig        "$GITDIR/config"
link gitignore_global "$GITDIR/ignore"

# Vim
link vimrc            "$HOME/.vimrc"

# Ghostty
link ghostty.conf     "$CONFIG/ghostty/config.ghostty"

# fd (also what fzf's Ctrl-T / Alt-C walk with)
link fdignore         "$CONFIG/fd/ignore"

# Machine-local config: copy (don't symlink) so edits stay off the repo.
seed() {
  [[ -f "$2" ]] || { cp "$DOTFILES/$1" "$2"; echo "created $2 from template — review it"; }
}
seed zshrc.local.example     "$HOME/.zshrc.local"
seed zprofile.local.example  "$HOME/.zprofile.local"
seed gitconfig.local.example "$GITDIR/config.local"
seed gitconfig.work.example  "$GITDIR/config.work"

# Homebrew packages
if command -v brew >/dev/null 2>&1; then
  read -r -p "Run 'brew bundle' to install packages? [y/N] " ans || ans=n
  [[ "$ans" == [Yy]* ]] && brew bundle --file="$DOTFILES/Brewfile"
else
  echo "Homebrew not found — install it first: https://brew.sh"
fi

echo "Done. Restart your shell or run: source ~/.zshrc"
