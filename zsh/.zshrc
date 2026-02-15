# ============================================================
# Zsh Configuration - Final Optimized (2026)
# ============================================================

# ----------------------------
# Safety / shell behavior
# ----------------------------
[[ -o interactive ]] || return


# ----------------------------
# Aliases
# ----------------------------
alias backup_demos="$HOME/Docs/Cloud/Dev/dotfiles/sh/backup_demos.sh"
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"
alias edit_dotfiles="cd $HOME/Docs/Cloud/Dev/dotfiles/ && code ."
alias cdm="cd /Volumes/MOVIES/sort"
alias chad="source $HOME/Docs/Cloud/Dev/dotfiles/sh/chad.sh"
alias create_icons="source $HOME/Docs/Cloud/Dev/dotfiles/sh/create_icons.sh"
alias cleanup="python3 $HOME/Docs/Cloud/Dev/dotfiles/sh/cleanup.py"
alias clear_cache="source $HOME/Docs/Cloud/Dev/dotfiles/sh/clear_cache.sh"
alias cpp="pwd | pbcopy"
alias dev="cd $HOME/Docs/Dev"
alias fetch-json="bash $HOME/Docs/Cloud/Dev/dotfiles/sh/fetch-json.sh"
alias gcl="git clone"
alias greep="greep --color=auto"
alias h="history"
alias i="kitty +kitten icat"
alias live="$HOME/Docs/Cloud/Dev/dotfiles/sh/live.sh"
alias mip="curl 'https://api.ipify.org/?format=json'"
alias of="cd $HOME/Docs/Dev/OF/0.12.1/"
alias p="python"
alias repair_zsh="source $HOME/Docs/Cloud/Dev/dotfiles/sh/repaire_zsh_history.sh"
alias sd="source $HOME/Docs/Cloud/Dev/dotfiles/sh/sd.sh"
alias s="kitty +kitten ssh"
alias t="kitty +kitten transfer"
alias top="htop"
alias v="nvim"
alias xcode="open -a Xcode"
alias yt="yt-dlp --force-generic-extractor"


# ----------------------------
# PATH / toolchain
# ----------------------------
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

[[ -d "$BUN_INSTALL/bin" ]] && export PATH="$BUN_INSTALL/bin:$PATH"
[[ -d "/opt/homebrew/opt/postgresql@15/bin" ]] && export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
[[ -d "/opt/homebrew/opt/sqlite/bin" ]] && export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
[[ -d "/opt/homebrew/opt/llvm/bin" ]] && export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export CC=clang
export CXX=clang++


# ----------------------------
# Build flags
# ----------------------------
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"


# ----------------------------
# Locale
# ----------------------------
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"


# ----------------------------
# Oh My Zsh
# ----------------------------
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  copybuffer
  copyfile
  copypath
  emoji
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Dim italic (clean + modern)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#a0a0a0'

source "$ZSH/oh-my-zsh.sh"


# ----------------------------
# Directory change hooks
# (auto venv + git info)
# ----------------------------
autoload -Uz add-zsh-hook
typeset -g last_repository=""

chpwd_functions_setup() {
  local repo venv_path

  # --- Python venv auto-activation ---
  if [[ -d ".venv" ]]; then
    venv_path="$(pwd)/.venv"
  elif [[ -d "venv" ]]; then
    venv_path="$(pwd)/venv"
  else
    venv_path=""
  fi

  # Activate if needed
  if [[ -z "$VIRTUAL_ENV" && -n "$venv_path" ]]; then
    source "$venv_path/bin/activate"
  fi

  # Deactivate if leaving project
  if [[ -z "$venv_path" && -n "$VIRTUAL_ENV" ]]; then
    deactivate 2>/dev/null
  fi

  # --- Git repo detection (onefetch) ---
  repo=$(git rev-parse --show-toplevel 2>/dev/null) || repo=""

  if [[ -n "$repo" && "$repo" != "$last_repository" ]]; then
    command -v onefetch >/dev/null && onefetch --ascii-input 'Yo!'
  fi

  last_repository="$repo"
}

add-zsh-hook chpwd chpwd_functions_setup
chpwd_functions_setup


# ----------------------------
# Pro prompt (2-line, minimal)
# ----------------------------
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{cyan}(%b|%a)%f'

precmd() {
  vcs_info

  # Add dirty marker (*)
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    if ! git diff --quiet --ignore-submodules -- 2>/dev/null || \
       ! git diff --cached --quiet --ignore-submodules -- 2>/dev/null; then
      vcs_info_msg_0_="${vcs_info_msg_0_}*"
    fi
  fi
}

venv_prompt() {
  [[ -n "$VIRTUAL_ENV" ]] && print -r -- " %F{yellow}[${VIRTUAL_ENV:t}]%f"
}

status_prompt() {
  local code=$?
  (( code != 0 )) && print -r -- " %F{red}✗${code}%f"
}

PROMPT='%F{magenta}%~%f${vcs_info_msg_0_}$(venv_prompt)$(status_prompt)
%F{cyan}❯%f '


# ----------------------------
# Greeting
# ----------------------------
print -r -- "  🚀 ..."
print -r -- ""