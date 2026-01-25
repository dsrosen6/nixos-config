#!/usr/bin/env bash

SUBMAP="$1"
ACTIVE_COLOR="$2"
INACTIVE_COLOR="$3"
NOGRP_ACTIVE_COLOR="$4"
NOGRP_INACTIVE_COLOR="$5"

if [[ -z "$INACTIVE_COLOR" ]]; then
    INACTIVE_COLOR="$ACTIVE_COLOR"
fi

if [[ -z "$NOGRP_ACTIVE_COLOR" ]]; then
    NOGRP_ACTIVE_COLOR = "$ACTIVE_COLOR"
fi

if [[ -z "$NOGRP_INACTIVE_COLOR" ]]; then
    NOGRP_INACTIVE_COLOR = "$INACTIVE_COLOR"
fi

hyprctl dispatch submap "$SUBMAP"
if [[ -n "$ACTIVE_COLOR" ]]; then
    hyprctl keyword general:col.active_border "$ACTIVE_COLOR"
    hyprctl keyword group:col.border_active "$ACTIVE_COLOR"
    hyprctl keyword group:groupbar:col.active "$ACTIVE_COLOR"
fi

if [[ -n "$INACTIVE_COLOR" ]]; then
    hyprctl keyword general:col.inactive_border "$INACTIVE_COLOR"
    hyprctl keyword group:col.border_inactive "$INACTIVE_COLOR"
    hyprctl keyword group:groupbar:col.inactive "$INACTIVE_COLOR"
fi

if [[ -n "$NOGRP_ACTIVE_COLOR" ]]; then
    hyprctl keyword general:col.nogroup_border_active = "$NOGRP_ACTIVE_COLOR"
fi

if [[ -n "$NOGRP_INACTIVE_COLOR" ]]; then
    hyprctl keyword general:col.nogroup_border = "$NOGRP_INACTIVE_COLOR"
fi
