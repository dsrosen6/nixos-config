{
  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "top";
      position = "top";
      modules-left = [
        "custom/nix"
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "network"
        "battery"
      ];
      "hyprland/workspaces" = {
        disable-scroll = true;
        show-special = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{name}";
        persistent-workspaces = {
          "eDP-1" = [
            1
            2
            3
            4
            5
          ];
          "DP-1" = [
            1
            2
            3
            4
            5
          ];
        };
      };
      network = {
        format-wifi = "󰖩 {essid}";
        format-ethernet = "  Wired";
        tooltip-format = "{ifname} via {gwaddr}";
        format-disconnected = "󰖪";
      };
      battery = {
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{icon} {capacity}%";
        format-alt = "{icon}";
        format-icons = {
          default = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂁"
            "󰁹"
          ];
          charging = [

            "󰢟"
            "󰢜"
            "󰂆"
            "󰂇"
            "󰂈"
            "󰢝"
            "󰂉"
            "󰢞"
            "󰂊"
            "󰂋"
            "󰂅"
          ];
          plugged = [
            ""
          ];
          full = [
            "󰁹"
          ];
        };
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          default = [
            ""
          ];
        };
        on-click = "pavucontrol";
      };
      clock = {
        format = "{:%I:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%d|%I:%M}";
      };
      "custom/nix" = {
        format = "󱄅";
        tooltip = true;
        tooltip-format = "btw";
      };
    };
  };
}
