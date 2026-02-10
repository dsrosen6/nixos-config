{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    syntaxHighlighting.enable = true;
    autosuggestion = {
      enable = true;
      strategy = [
        "completion"
        "history"
      ];
    };

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    shellAliases = {
      gitig = "touch .gitignore && echo -e '*.env\n*.DS_Store\n.idea' >> .gitignore";
      nb = "sudo nixos-rebuild switch --flake ~/nixos#thinkpad";
      lg = "lazygit";
      nxcd = "cd ~/nixos";
      n = "nvim";
      nvnv = "cd ~/.config/nvim && nvim";
      nxnv = "cd ~/nixos && nvim";
    };
  };
}
