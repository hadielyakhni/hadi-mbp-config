{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    enableFzf = true;
    # What is this?
    enableMouse = true;
    iTerm2 = true;
    extraConfig = ''
      # Theme and visuals
      set -g status-style bg=blue,fg=white # Status line background and foreground

      # TODO: Setting a background color produces weird results in PyCharm terminal. Try to investigate the problem?
      # set -g window-style fg=colour247,bg=black # Default window text and background color
      # set -g window-active-style fg=white,bg=black # Active window text and background color
      
      # Set tmux to use 256 colors, enabling more themes and customization
      set -g default-terminal "screen-256color"

      # Status Bar Configuration
      set -g status-left "#[fg=green]Session: #S #[fg=white]|#[fg=yellow] #I #[fg=white]|#[fg=cyan]#P " # Left side of status bar
      set -g status-right "#[fg=green]%Y-%m-%d %H:%M:%S" # Right side of status bar

      # Pane border styling
      set -g pane-border-style fg=colour235 # Inactive pane border color
      set -g pane-active-border-style fg=colour51 # Active pane border color

      # Set history limit
      set -g history-limit 10000

      # Enable message styling
      set -g message-style fg=white,bg=blue

      # Keybindings for horizontal and vertical pane splitting
      bind | split-window -h
      bind - split-window -v

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Enable shift-arrow to switch windows
      bind -n S-Left previous-window
      bind -n S-Right next-window
    '';
  };
}
