# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'rose-pine/tmux'
# ... alongside
set -g @rose_pine_variant 'moon' # Options are 'main', 'moon' or 'dawn'
set -g default-terminal "xterm-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
#pluin run
run '~/.config/tmux/plugins/tpm/tpm'
#default shell 
set-option -g default-shell /bin/zsh

bind -n M-o display-popup -w 90% -h90% -E "crush"
