{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      bind "/" split-window -h
      bind "'" split-window -v

      bind-key -r h select-pane -L
      bind-key -r j select-pane -D
      bind-key -r k select-pane -U
      bind-key -r l select-pane -R

      bind-key -n M-h select-pane -L
      bind-key -n M-j select-pane -D
      bind-key -n M-k select-pane -U
      bind-key -n M-l select-pane -R

      bind -r H resize-pane -L 7
      bind -r J resize-pane -D 7
      bind -r K resize-pane -U 7
      bind -r L resize-pane -R 7

      set -sg escape-time 5
      set -g default-terminal xterm-256color
      set -g mouse on
      set -g repeat-time 1000
    '';
  };
}
