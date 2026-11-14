#!/usr/bin/env zsh

autoload -U compinit; compinit
_comp_options+=(globdots)
zmodload -i zsh/complist

. "${XDG_CONFIG_HOME}/zsh/aliases.sh"
. "${XDG_CONFIG_HOME}/zsh/utils.sh"
. "${XDG_CONFIG_HOME}/zsh/completions.sh"
. "${XDG_CONFIG_HOME}/zsh/keybindings.sh"
. "${XDG_CONFIG_HOME}/zsh/prompt.sh"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. /usr/share/nvm/init-nvm.sh
setopt HIST_SAVE_NO_DUPS

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
if [ -e /home/senioravanti/.nix-profile/etc/profile.d/nix.sh ]; then . /home/senioravanti/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

