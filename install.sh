#!/bin/bash
# Symlink dotfiles into $HOME and set up a new machine.
# Safe to re-run: existing real files are backed up to <file>.bak once.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# Shell / git
link zshrc            "$HOME/.zshrc"
link gitconfig        "$HOME/.gitconfig"
link gitignore_global "$HOME/.gitignore_global"

# Vim
link vimrc            "$HOME/.vimrc"

# Machine-local config: copy (don't symlink) so edits stay off the repo.
if [[ ! -f "$HOME/.zshrc.local" ]]; then
  cp "$DOTFILES/zshrc.local.example" "$HOME/.zshrc.local"
  echo "created ~/.zshrc.local from template — review it"
fi

# Homebrew packages
if command -v brew >/dev/null 2>&1; then
  read -r -p "Run 'brew bundle' to install packages? [y/N] " ans
  [[ "$ans" == [Yy]* ]] && brew bundle --file="$DOTFILES/Brewfile"
else
  echo "Homebrew not found — install it first: https://brew.sh"
fi

echo "Done. Restart your shell or run: source ~/.zshrc"
