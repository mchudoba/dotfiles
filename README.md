# dotfiles

Personal dotfiles

## Setup on a new machine

```sh
# 1. Install Homebrew (https://brew.sh), then:
git clone git@github.com:<you>/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

`install.sh` symlinks the configs into `$HOME`, backs up any pre-existing real
files as `<file>.bak`, seeds `~/.zshrc.local` from the template, and offers to
run `brew bundle`. It's idempotent — safe to re-run.

## What's here

| File | Linked to | Purpose |
|------|-----------|---------|
| `zshrc` | `~/.zshrc` | zsh config (powerlevel10k prompt, plugins, aliases) |
| `zshrc.local.example` | copied to `~/.zshrc.local` | machine-local / work config, **not** symlinked |
| `gitconfig` | `~/.gitconfig` | git settings |
| `gitignore_global` | `~/.gitignore_global` | global gitignore |
| `vimrc` | `~/.vimrc` | vim config (no plugins, stock vim 9.1+) |
| `colors/iterm2/` | iTerm2 (manual) | iTerm2 color schemes |
| `Brewfile` | — | `brew bundle` package list |
| `cleanup-git-branches` | — | utility: prune merged branches across repos |

## Notes

- **Local config** (project aliases, tokens) lives in `~/.zshrc.local`, sourced at
  the end of `~/.zshrc`. Edit it freely; it never touches this repo.
- **Regenerate the Brewfile** from what's installed: `brew bundle dump --force`.
- **iTerm2 colors** must be imported manually: Preferences → Profiles → Colors →
  Import (`colors/iterm2/*.itermcolors`).
