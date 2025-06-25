#!/usr/bin/env bash

# This script will configure keybindings regarding screenshots, snips and printscreen behaviour.
# The new behaviour is more inline with Windows.
#
# Keybindings:
#   - PrScr         - Capture all screens and store it in clipboard (and at /tmp/snip.png)
#   - Super+Shift+S - Capture area and store it in clipboard (and at /tmp/snip.png)
#   - Shift+PrScr   - Use native gnome screenshot and screencast tool

sudo apt install gnome-screenshot -y

# Disable most of the built in screenshot key bindings
gsettings set org.gnome.shell.keybindings show-screen-recording-ui '[]' # You can still access interactive screencast by pressing Shift+Print
gsettings set org.gnome.shell.keybindings screenshot '[]'
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift>Print']"
gsettings set org.gnome.shell.keybindings screenshot-window '[]'

# Create custom shortcuts to recreate screenshot behaviour
# FIXME: Overrides all other custom shortcuts. Fine for now but will need to be fixed for any other custom shortcuts. Probably by creating a script explicitely for appending new custom shortcuts.
custom_shortcuts_parent_schema="org.gnome.settings-daemon.plugins.media-keys"
custom_shortcuts_path_prefix="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom"

gsettings set $custom_shortcuts_parent_schema custom-keybindings "['${custom_shortcuts_path_prefix}0/', '${custom_shortcuts_path_prefix}1/']"

gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}0/ name "Print Screen"
gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}0/ command "gnome-screenshot -cf /tmp/snip.png"
gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}0/ binding "Print"

gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}1/ name "Snipping Tool"
gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}1/ command "gnome-screenshot -acf /tmp/snip.png"
gsettings set ${custom_shortcuts_parent_schema}.custom-keybinding:${custom_shortcuts_path_prefix}1/ binding "<Super><Shift>s"

