#!/usr/bin/env zsh

# git init --bare $HOME/.dotfiles
# dot config --local status.showUntrackedFiles no
# git clone --bare <remote-git-repo-url> $HOME/.dotfiles 
# dot checkout
# dot add -f ./
# dot config --local core.excludesFile <path to your gitignore>
# https://gist.github.com/ennanco/d1c6a228f5aac23a3af6592135f0f8ae
# https://coffeeaddict.dev/how-to-manage-dotfiles-with-git-bare-repo/
dot() {
  git --git-dir="$HOME/.dotfiles" \
    --work-tree="$HOME/.config" \
    "$@"
}

pswdgen() {
	openssl rand -base64 $1 | tr -d '=' | tr '+/' '-_'
}

mvn-project() {
  if [ ! -d "$1" ]; then
    echo 'project dir does not exist'
    return
  fi
  if [ -z "$2" ]; then
    echo 'artifact id is empty' 
    return
  fi

  cd "$1"
  mvn archetype:generate \
    -DgroupId=ru.senioravanti \
    -DartifactId="$2" \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DinteractiveMode=false
  cd -
}

open-idea() {
  if [ ! -d "$1" ]; then
    echo "\`$1\` is not a directory"
    return
  fi
  nohup idea "$1" 2>&1 > /dev/null &
}

open-goland() {
  if [ -d "$1" -o -f "$1" ]; then
    nohup goland "$1" 2>&1 > /dev/null &
    return
  fi
  echo "\`$1\` is not a directory"
}

source "${XDG_CONFIG_HOME}/zsh/aliases.sh"

autoload -U compinit; compinit
_comp_options+=(globdots)
zmodload -i zsh/complist

source "${XDG_CONFIG_HOME}/zsh/aliases.sh"

autoload -U compinit; compinit
_comp_options+=(globdots)
zmodload -i zsh/complist
source "${XDG_CONFIG_HOME}/zsh/completions.sh"
source "${XDG_CONFIG_HOME}/zsh/keybindings.sh"

source "${XDG_CONFIG_HOME}/zsh/prompt.sh"

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

if ! ss -anp | grep '1337' > /dev/null; then
  echo 'starting socks5 proxy through ssh ...'
  ssh -D 1337 -q -C -N -f root@194.58.42.13
else
  echo 'proxy already running ...'
fi  

