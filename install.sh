#!/usr/bin/env bash
set -euo pipefail

DOT=~/Docs/Cloud/Dev/dotfiles

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "linked: $dst -> $src"
}

link "$DOT/tmux/.tmux.conf"          "$HOME/.tmux.conf"
link "$DOT/zsh/.zshrc"               "$HOME/.zshrc"
link "$DOT/zsh/.zprofile"            "$HOME/.zprofile"
link "$DOT/kitty/"                   "$HOME/.config/kitty"
