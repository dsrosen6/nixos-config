#!/usr/bin/env bash

hyprctl dispatch submap $1
hyprctl keyword general:col.active_border $2
hyprctl keyword group:col.border_active $2
hyprctl keyword group:groupbar:col.active $2
