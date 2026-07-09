#!/bin/bash
# Symlink dotfiles into $HOME and set up a new machine.
# Safe to re-run: existing real files are backed up to <file>.bak once.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
GITDIR="$CONFIG/git"

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

if [[ -e "$HOME/.gitconfig" ]]; then
  echo "WARNING: ~/.gitconfig overrides ~/.config/git/config — fold it in and delete it"
fi

# Shell
link zshrc            "$HOME/.zshrc"
link p10k.zsh         "$HOME/.p10k.zsh"

# Git
link gitconfig        "$GITDIR/config"
link gitignore_global "$GITDIR/ignore"

# Vim
link vimrc            "$HOME/.vimrc"

# fd (also what fzf's Ctrl-T / Alt-C walk with)
link fdignore         "$CONFIG/fd/ignore"

# Machine-local config: copy (don't symlink) so edits stay off the repo.
if [[ ! -f "$HOME/.zshrc.local" ]]; then
  cp "$DOTFILES/zshrc.local.example" "$HOME/.zshrc.local"
  echo "created ~/.zshrc.local from template — review it"
fi
if [[ ! -f "$GITDIR/config.local" ]]; then
  cp "$DOTFILES/gitconfig.local.example" "$GITDIR/config.local"
  echo "created $GITDIR/config.local from template — review it"
fi
if [[ ! -f "$GITDIR/config.work" ]]; then
  cp "$DOTFILES/gitconfig.work.example" "$GITDIR/config.work"
  echo "created $GITDIR/config.work from template — review it"
fi

# Homebrew packages
if command -v brew >/dev/null 2>&1; then
  read -r -p "Run 'brew bundle' to install packages? [y/N] " ans
  [[ "$ans" == [Yy]* ]] && brew bundle --file="$DOTFILES/Brewfile"
else
  echo "Homebrew not found — install it first: https://brew.sh"
fi

echo "Done. Restart your shell or run: source ~/.zshrc"
