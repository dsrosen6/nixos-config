{ dotfiles, ... }:
{
  xdg.configFile = {
    "waybar/style.css".source = "${dotfiles}/waybar/style.css";
  };

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      # prevent waybar from starting with KDE
      target = "wayland-session@Hyprland.target";
    };
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
        "custom/swaync"
      ];
      "hyprland/workspaces" = {
        disable-scroll = true;
        show-special = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{name}";
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
      "custom/swaync" = {
        format = "";
        on-click = "swaync-client -t";
      };
    };
  };
}
