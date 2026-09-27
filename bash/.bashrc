# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
[[ -n $OMARCHY_PATH && -r $OMARCHY_PATH/default/bash/rc ]] && source "$OMARCHY_PATH/default/bash/rc"

# Personal exports, aliases, and functions shared with zsh
[[ -r ~/.config/shell/common.sh ]] && source ~/.config/shell/common.sh

# ssh-agent from `systemctl --user enable --now ssh-agent`
if [[ -z $SSH_AUTH_SOCK && -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
