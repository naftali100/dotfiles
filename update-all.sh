#!/usr/bin/env zsh

set -e

echo "Updating system packages..."

# Update system packages (Debian/Ubuntu)
if command -v apt-get &>/dev/null; then
    sudo apt-get update && sudo apt-get upgrade -y
fi

# Update system packages (Arch Linux)
if command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm
fi

# Update Homebrew (macOS/Linux)
if command -v brew &>/dev/null; then
    brew update && brew upgrade
fi

# Update Flatpak
if command -v flatpak &>/dev/null; then
    flatpak update
fi

# Update dnf
if command -v dnf &>/dev/null; then
    dnf upgrade
fi

echo "Updating Vim/Neovim plugins..."
if command -v nvim &>/dev/null; then
    nvim --headless -c "MasonUpdate" -c "qall"
    nvim --headless "+Lazy! sync" +qa
fi

echo "Updating Tmux plugins..."
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
fi

echo "Updating Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    omz update
fi

echo "Updating dotfiles repository..."
if [ -d "$HOME/dotfiles" ]; then
    cd "$HOME/dotfiles"
    git pull --rebase
    git submodule update --init --recursive
    cd -
fi

echo "All updates complete!"
