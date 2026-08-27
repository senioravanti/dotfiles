export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export GOROOT=/usr/lib/go
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/zed.app/bin:$HOME/projects/devops/scripts/actions:$GOPATH/bin:/opt/idea/bin:/opt/goland/bin:/opt/async-profiler/bin"

export TERMINAL=/usr/bin/alacritty
export GRAALVM_HOME="${HOME}/.sdkman/candidates/java/25.0.2-graalce/"

source /home/senioravanti/.config/zsh/aliases.sh
source /usr/share/nvm/init-nvm.sh

setopt HIST_SAVE_NO_DUPS

source "$HOME/.config/zsh/completion.sh"
source "$HOME/.config/zsh/prompt.sh"
source "$HOME/.config/zsh/keybindings.sh"
source "$HOME/.config/zsh/utils.sh"

# proxy_port=13337
# if ! ss -anp | grep "${proxy_port}" > /dev/null; then
#   echo 'starting socks5 proxy through ssh ...'
#   ssh -D ${proxy_port} -q -C -N -f root@194.58.42.13
# else
#   echo 'proxy already running ...'
# fi
