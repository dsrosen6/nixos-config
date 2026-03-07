#!/usr/bin/env bash

if pgrep waybar; then
    systemctl --user stop waybar.service
    systemctl --user start waybar.service
else
    echo "waybar not running, nothing to do"
fi
