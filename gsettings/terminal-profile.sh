#!/usr/bin/env bash

# This script will configure the default profile in gnome-terminal

profile_id=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
schema_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile_id}/"

# Colors
gsettings set ${schema_path} background-color 'rgb(0,0,0)'
gsettings set ${schema_path} background-transparency-percent 15
gsettings set ${schema_path} foreground-color 'rgb(255,255,255)'
gsettings set ${schema_path} use-theme-colors false
gsettings set ${schema_path} use-theme-transparency false
gsettings set ${schema_path} use-transparent-background true
