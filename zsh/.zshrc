#!/usr/bin/env zsh

autoload -U compinit; compinit
_comp_options+=(globdots)
zmodload -i zsh/complist

. "${XDG_CONFIG_HOME}/zsh/aliases.sh"
. "${XDG_CONFIG_HOME}/zsh/utils.sh"
. "${XDG_CONFIG_HOME}/zsh/completions.sh"
. "${XDG_CONFIG_HOME}/zsh/keybindings.sh"
. "${XDG_CONFIG_HOME}/zsh/prompt.sh"

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$PATH:${HOME}/.local/bin:${HOME}/go/bin:${HOME}/syncthing:${HOME}/jdk/jdk-21.0.5+11/bin:/opt/ideaIU-2025.2/bin:/opt/goland/bin:/usr/local/go/bin"
export GOPATH="$HOME/go"

export GRAALVM_HOME="${HOME}/.sdkman/candidates/java/25.0.2-graalce/"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# use mtproxy instread
# if ! ss -anp | grep '1337' > /dev/null; then
#   echo 'starting socks5 proxy through ssh ...'
#   ssh -D 1337 -q -C -N -f root@194.58.42.13
# else
#   echo 'proxy already running ...'
# fi  
