# Read for EVERY zsh invocation — interactive, non-interactive, and scripts —
# unlike ~/.zshrc, which only runs for interactive shells. Env vars that tools
# spawning `zsh -c` must see (git's editor, cron jobs, `crontab -e`) belong here.
#
# Do NOT build PATH here, it lives in ~/.zprofile.

export EDITOR=vim
export VISUAL=vim
