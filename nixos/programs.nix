{
  programs = {
    # 1Password is in here because the Home Manager version won't link with browser extensions.
    _1password-gui.enable = true;
    _1password.enable = true; # op CLI
    zsh.enable = true;
    nix-ld.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
}
