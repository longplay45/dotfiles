# Set the PATH to include /usr/local/bin and $PATH
export PATH="/usr/local/bin:$PATH"
DYLD_LIBRARY_PATH=$HOME/local/lib:/usr/local/lib
export DYLD_LIBRARY_PATH

DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib:/usr/lib
export DYLD_FALLBACK_LIBRARY_PATH

# Set the ZSH path
export ZSH="$HOME/.oh-my-zsh"

# Set DYLD_LIBRARY_PATH for SQLite and other paths related to SQLite
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sqlite/3.45.0/lib:/usr/lib"

# Set PKG_CONFIG_PATH for Homebrew SQLite
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"

# Add Homebrew SQLite binaries to PATH
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# Set LDFLAGS and CPPFLAGS for Homebrew SQLite
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# Add PostgreSQL and TeX binaries to PATH
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Library/TeX/texbin/pdflatex:$PATH"

# Add ~/bin to PATH
export PATH=~/bin:$PATH

# Set the locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set the Conda environment to 'data311'
export CONDA_ENV=data311

# Set the default editor
export EDITOR=$HOME/Docs/Cloud/Dev/dotfiles/sh/edit.sh

# Define plugins for Oh My Zsh
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

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Define aliases
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"
alias ea="conda activate "
alias ed="conda deactivate "
alias edit_dotfiles="cd $HOME/Docs/Cloud/Dev/dotfiles/ && code ."
alias cdm="cd /Volumes/MOVIES/sort"
alias cdb="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdb.sh"
alias cdd="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdd.sh"
alias cdp="source $HOME/Docs/Cloud/Dev/dotfiles/sh/cdp.sh"
alias chad="source $HOME/Docs/Cloud/Dev/dotfiles/sh/chad.sh"
alias create_icons="source $HOME/Docs/Cloud/Dev/dotfiles/sh/create_icons.sh"
alias cleanup="python3 $HOME/Docs/Cloud/Dev/dotfiles/sh/cleanup.py"
alias cpp="pwd|pbcopy"  # Copy current path to clipboard
alias dev="cd $HOME/Docs/Dev"
alias gcl='git clone'
alias greep='greep --color=auto'
alias h='history'
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
alias yt="yt-dlp "

# Function to deactivate conda before running brew and reactivate conda if needed
brew() {
    local conda_env="$CONDA_DEFAULT_ENV"
    while [ "$CONDA_SHLVL" -gt 0  ]; do
        conda deactivate
    done
    command brew $@
    local brew_status=$?
    [ -n "${conda_env:+x}" ] && conda activate "$conda_env"
    return "$brew_status"
}

# Function to check for .env file and activate virtual environment
cd() {
    check_directory_for_new_repository
    builtin cd "$@" && {
        if [[ -f .env ]]; then
            source .env
        fi

        if [[ -f venv ]]; then
            source venv/bin/activate
        fi
    }
}

# Source bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Set bun environment variables
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Set PATH for pipx binaries
export PATH="$PATH:$HOME/.local/bin"

# Function to greet git repositories using onefetch
last_repository=
check_directory_for_new_repository() {
    current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
    
    if [ "$current_repository" ] && \
       [ "$current_repository" != "$last_repository" ]; then
        onefetch --ascii-input 'Yo!'
    fi
    last_repository=$current_repository
}

# Initial call to check for new repositories
check_directory_for_new_repository

# Display a rocket emoji after loading
echo "  -> $emoji[rocket]..."
echo ""

# Initialize Conda if available
if command -v conda &>/dev/null; then
    # Initialize Conda
    __conda_setup="$('/Users/i/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/i/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/i/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/i/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    # Deactivate Conda
    conda deactivate
fi
