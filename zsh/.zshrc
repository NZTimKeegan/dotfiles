# The next line updates PATH for egcli command.
if [ -f '/Users/tim.keegan/Library/Group Containers/FELUD555VC.group.com.egnyte.DesktopApp/CLI/egcli.inc' ]; then . '/Users/tim.keegan/Library/Group Containers/FELUD555VC.group.com.egnyte.DesktopApp/CLI/egcli.inc'; fi
. "$HOME/.local/bin/env"

# mise activation
[[ -x ~/.local/bin/mise ]] && eval "$(~/.local/bin/mise activate zsh)"

##########################
# AUTO COMPLETE SETTINGS #
##########################

# Initialise completion system
autoload -U compinit; compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'

# Enable completing dotfiles
_comp_options+=(globdots)

########################
# PROMPT CUSTOMISATION #
########################
fpath=($HOME/.config/zsh/prompt $fpath)
autoload -Uz prompt_setup; prompt_setup

##################
# ENABLE VI MODE #
##################
bindkey -v
