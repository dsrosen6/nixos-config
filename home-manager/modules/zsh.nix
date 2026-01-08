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
      build-tp = "sudo nixos-rebuild switch --flake ~/nixos#thinkpad";
      build-dt = "sudo nixos-rebuild switch --flake ~/nixos#desktop";
      nixconf = "cd ~/nixos && nvim";
      nvconf = "cd ~/.config/nvim && nvim";
    };
  };
}
