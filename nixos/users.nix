{ pkgs, ... }:
{
  users.users.danny = {
    isNormalUser = true;
    description = "Danny Rosenthal";
    shell = pkgs.zsh;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };
}
