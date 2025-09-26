#!/usr/bin/env bash

set -e

PLAYBOOK="install_tools.yml"

# Function to install Ansible on Debian/Ubuntu
install_ansible_debian() {
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
}

# Function to install Ansible on Arch Linux
install_ansible_arch() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm ansible
}

# Function to install Ansible on Fedora
install_ansible_fedora() {
    sudo dnf install -y ansible
}

# Function to install Ansible on macOS
install_ansible_macos() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install ansible
}

# Function to install Ansible on Termux
install_ansible_termux() {
    pkg update
    pkg install -y python
    pip install --upgrade pip
    pip install ansible
}

# Detect the platform and install Ansible
install_ansible() {
    OS="$(uname -s)"
    case "${OS}" in
        Linux*)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                case "${ID}" in
                    debian|ubuntu)
                        install_ansible_debian
                        ;;
                    arch|endeavouros)
                        install_ansible_arch
                        ;;
                    fedora)
                        install_ansible_fedora
                        ;;
                    *)
                        echo "Unsupported Linux distribution: ${ID}"
                        exit 1
                        ;;
                esac
            elif [ -d /data/data/com.termux ]; then
                install_ansible_termux
            else
                echo "Cannot determine Linux distribution."
                exit 1
            fi
            ;;
        Darwin*)
            install_ansible_macos
            ;;
        *)
            echo "Unsupported operating system: ${OS}"
            exit 1
            ;;
    esac
}

# Run the Ansible playbook
run_playbook() {
    if [ ! -f "${PLAYBOOK}" ]; then
        echo "Playbook ${PLAYBOOK} not found in the current directory."
        exit 1
    fi
    ansible-playbook "${PLAYBOOK}"
}

# Main execution
install_ansible
run_playbook
