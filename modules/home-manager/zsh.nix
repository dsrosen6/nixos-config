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
      nb = "sudo nixos-rebuild switch --flake ~/nixos#thinkpad";
      nixconf = "cd ~/nixos/";
      nv = "nvim";
    };
  };
}
