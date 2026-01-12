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

    shellAliases = {
      gitig = "touch .gitignore && echo -e '*.env\n*.DS_Store\n.idea' >> .gitignore";
      blt = "sudo nixos-rebuild switch --flake ~/nixos#thinkpad";
      bpc = "sudo nixos-rebuild switch --flake ~/nixos#desktop";
      nxcd = "cd ~/nixos";
      nxnv = "cd ~/nixos && nvim";
      nvnv = "cd ~/.config/nvim && nvim";
    };
  };
}
