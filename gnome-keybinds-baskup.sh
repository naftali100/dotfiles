#!/usr/bin/env bash
set -e

mkdir -p gnome3-keybind-backup

if [[ $1 == 'backup' ]]; then
    dconf dump '/org/gnome/desktop/wm/keybindings/' > gnome3-keybind-backup/keybindings.dconf
    dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > gnome3-keybind-backup/custom-values.dconf
    dconf read '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings' > gnome3-keybind-backup/custom-keys.dconf
    echo "backup done"
    exit 0
fi

if [[ $1 == 'restore' ]]; then
    dconf reset -f '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/'
    dconf reset -f '/org/gnome/desktop/wm/keybindings/'
    dconf load '/org/gnome/desktop/wm/keybindings/' < gnome3-keybind-backup/keybindings.dconf
    dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' < gnome3-keybind-backup/custom-values.dconf
    dconf write '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings' "$(cat gnome3-keybind-backup/custom-keys.dconf)"
    echo "restore done"
    exit 0
fi

echo "parameter 0: [backup|restore]"

