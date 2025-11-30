let
  stylePath = ../../dotfiles/waybar/style.css;
in
{
  xdg.configFile = {
    "waybar/style.css".source = "${stylePath}";
  };

  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "top";
      position = "top";
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "battery"
        "network"
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
        format-wifi = "󰖩";
        format-ethernet = "";
        tooltip-format = "{ifname} via {gwaddr}";
        format-disconnected = "󰖪";
      };
      battery = {
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{icon}";
        format-alt = "{icon} {capacity}%";
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
