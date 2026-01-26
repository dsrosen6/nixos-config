{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # GPU settings GUI
  services.lact.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    goverlay
  ];
}
