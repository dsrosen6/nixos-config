#!/usr/bin/env bash

MONITOR_NAME="eDP-1"
MONITOR_SETTINGS="1920x1200,3440x0,1.25"

enable_monitor() {
    hyprctl keyword monitor "$MONITOR_NAME,$MONITOR_SETTINGS"
}

disable_monitor() {
    hyprctl keyword monitor "$MONITOR_NAME,disable"
}

detect_and_set() {
    lid_state=$(cat /proc/acpi/button/lid/LID/state)
    if grep -q "closed" <<<"$lid_state"; then
        echo "lid state closed; disabling monitor"
        disable_monitor
    elif grep -q "open" <<<"$lid_state"; then
        echo "lid state open; enabling monitor"
        enable_monitor
    else
        echo "unknown lid state"
    fi
}

if [[ "$1" == "off" ]]; then
    disable_monitor
    exit 0
elif [[ "$1" == "on" ]]; then
    enable_monitor
    exit 0
elif [[ "$1" == "detect" ]]; then
    detect_and_set
    exit 0
else
    echo "unknown argument: $1"
    exit 1
fi
