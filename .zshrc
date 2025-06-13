# ============================
# Zsh Configuration - 2025.06.11 Version 002
# ============================

# ----------------------------
# Aliases
# ----------------------------
# Define command shortcuts

alias backup="/Users/i/Docs/Cloud/Dev/dotfiles/sh/backup_mp3_demos.sh"
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"
alias edit_dotfiles="cd $HOME/Docs/Cloud/Dev/dotfiles/ && code ."
alias cdm="cd /Volumes/MOVIES/sort"
alias cdb="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdb.sh"
alias cdd="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdd.sh"
alias cdp="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdp.sh"
alias chad="source $HOME/Docs/Cloud/Dev/dotfiles/sh/chad.sh"
alias create_icons="source $HOME/Docs/Cloud/Dev/dotfiles/sh/create_icons.sh"
alias cleanup="python3 $HOME/Docs/Cloud/Dev/dotfiles/sh/cleanup.py"
alias cpp="pwd | pbcopy"  # Copy current path to clipboard
alias dev="cd $HOME/Docs/Dev"
alias gcl="git clone"
alias greep="greep --color=auto"
alias h="history"
alias i="kitty +kitten icat"
alias live="$HOME/Docs/Cloud/Dev/dotfiles/sh/live.sh"
alias mip="curl 'https://api.ipify.org/?format=json'"
alias of="cd $HOME/Docs/Dev/OF/0.11.2/"
alias p="python"
alias repair_zsh="source $HOME/Docs/Cloud/Dev/dotfiles/sh/repaire_zsh_history.sh"
alias sd="source $HOME/Docs/Cloud/Dev/dotfiles/sh/sd.sh"
alias s="kitty +kitten ssh"
alias t="kitty +kitten transfer"
alias top="htop"
alias v="nvim"
alias xcode="open -a Xcode"
alias yt="yt-dlp"

# ----------------------------
# Environment Variables & PATH
# ----------------------------
# Prepend custom binaries to PATH for easier access
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$BUN_INSTALL/bin:~/bin:/usr/local/bin:/opt/homebrew/opt/postgresql@15/bin:/Library/TeX/texbin/pdflatex:/opt/homebrew/opt/sqlite/bin:$PATH"

# Dynamic library and build flags
export DYLD_LIBRARY_PATH="$HOME/local/lib:/usr/local/lib"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# Locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"

# Source bun completions if available
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ----------------------------
# Oh My Zsh Plugins
# ----------------------------
# Enable useful plugins for enhanced shell experience
plugins=(
  git
  Copybuffer
  Copyfile
  Copypath
  emoji
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh framework
source "$ZSH/oh-my-zsh.sh"

# ----------------------------
# Python: Auto-activate venv
# ----------------------------
# Automatically activate .venv if present in the directory
auto_activate_venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate 2>/dev/null
  fi
  if [[ -f .venv/bin/activate ]]; then
    source .venv/bin/activate
  fi
}

# ----------------------------
# Git: Show repo info with onefetch
# ----------------------------
# Display repository info when entering a git repo directory
check_directory_for_new_repository() {
  current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ "$current_repository" && "$current_repository" != "$last_repository" ]]; then
    onefetch --ascii-input 'Yo!'
  fi

  last_repository=$current_repository
}

# ----------------------------
# Override `cd` to auto-run venv and git checks
# ----------------------------
# Extend cd to activate virtualenv and show git info automatically
cd() {
  # builtin cd "$@" && auto_activate_venv && check_directory_for_new_repository
  builtin cd "$@" && check_directory_for_new_repository
}

# ----------------------------
# Greeting on shell start
# ----------------------------
# Display a simple startup message
echo "  🚀 ..."
echo ""
