#!/usr/bin/env zsh

set -e

echo "Updating system packages..."

# Update system packages (Debian/Ubuntu)
if command -v apt-get &>/dev/null; then
    echo "Updating APT packages..."
    sudo apt-get update && sudo apt-get upgrade -y
fi

# Update system packages (Arch Linux)
if command -v pacman &>/dev/null; then
    echo "Updating Pacman packages..."
    sudo pacman -Syu --noconfirm
fi

# Update Homebrew (macOS/Linux)
if command -v brew &>/dev/null; then
    echo "Updating Homebrew packages..."
    brew update && brew upgrade
fi

# Update Flatpak
if command -v flatpak &>/dev/null; then
    echo "Updating Flatpak packages..."
    flatpak update
fi

# Update dnf
if command -v dnf &>/dev/null; then
    echo "Updating DNF packages..."
    sudo dnf upgrade
fi

# update cargo packages
# if command -v cargo &>/dev/null; then
#     echo "Updating Cargo packages..."
#     cargo update
# fi

if command -v nvim &>/dev/null; then
    echo "Updating Vim/Neovim plugins..."
    nvim --headless -c "MasonUpdate" -c "qall"
    nvim --headless "+Lazy! sync" +qa
fi

# Update vscode extensions
if command -v code &>/dev/null; then
    echo "Updating VSCode extensions..."
    code --update-extensions
fi

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Updating Tmux plugins..."
    "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Updating Oh My Zsh..."
    omz update
fi

if [ -d "$HOME/dotfiles" ]; then
    echo "Updating dotfiles repository..."
    cd "$HOME/dotfiles"
    git pull --rebase
    git submodule update --init --recursive
    cd -
fi

echo "All updates complete!"
