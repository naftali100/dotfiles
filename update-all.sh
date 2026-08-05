#!/usr/bin/env zsh

set -e

echo "Updating system packages..."

# Update system packages (Debian/Ubuntu)
if command -v apt-get &>/dev/null; then
    echo "Updating APT packages..."
    sudo apt-get update && sudo apt-get upgrade -y
fi

# Update system packages (Arch Linux)
# Prefer an AUR helper if present (covers repo + AUR), else plain pacman
if command -v yay &>/dev/null; then
    echo "Updating Pacman + AUR packages (yay)..."
    yay -Syu --noconfirm
elif command -v paru &>/dev/null; then
    echo "Updating Pacman + AUR packages (paru)..."
    paru -Syu --noconfirm
elif command -v pacman &>/dev/null; then
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

# Update Rust toolchain (rustc, cargo, etc.)
if command -v rustup &>/dev/null; then
    echo "Updating Rust toolchains (rustup)..."
    rustup update
fi

# Update globally installed cargo binaries
# cargo update only touches a project's Cargo.lock; cargo-install-update
# (from the cargo-update crate) upgrades installed binaries instead.
if command -v cargo &>/dev/null; then
    if cargo install-update --version &>/dev/null; then
        echo "Updating Cargo binaries (cargo install-update)..."
        cargo install-update -a
    else
        echo "Skipping Cargo binary updates (install 'cargo-update' crate to enable)."
    fi
fi

# Update pipx-managed Python apps
if command -v pipx &>/dev/null; then
    echo "Updating pipx packages..."
    pipx upgrade-all
fi

# Update uv itself and uv-managed tools
if command -v uv &>/dev/null; then
    echo "Updating uv and uv tools..."
    uv self update 2>/dev/null || true
    uv tool upgrade --all 2>/dev/null || true
fi

# Update Go-installed binaries' toolchain note: `go install` binaries are not
# auto-tracked; update the Go-managed tools that are present.
if command -v go &>/dev/null; then
    echo "Cleaning Go module cache..."
    go clean -cache 2>/dev/null || true
fi

# Upgrade Bun runtime and global packages
if command -v bun &>/dev/null; then
    echo "Upgrading Bun..."
    bun upgrade
    echo "Updating Bun global packages..."
    bun update -g 2>/dev/null || true
fi

# Update tldr pages cache
if command -v tldr &>/dev/null; then
    echo "Updating tldr pages..."
    tldr --update 2>/dev/null || tldr -u 2>/dev/null || true
fi

# Update npm global packages
if command -v npm &>/dev/null; then
    echo "Updating npm global packages..."
    npm update -g
fi

# Update pnpm global packages
if command -v pnpm &>/dev/null; then
    echo "Updating pnpm global packages..."
    pnpm update -g
fi

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
