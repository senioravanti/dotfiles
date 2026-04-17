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

# sudo apt update && sudo apt install -y ruby-ascii85
# или openssl rand -base64 $1 | tr -d '=' | tr '+/' '-_'
# несколько паролей `for i in {1..${n:-10}}; do genpswd; done`
# 5 ascii символов для представления 4 байт, то есть пароль будет на 25% длинее запрощенного числа байт 
genpswd() {
  head -c "${1:-16}" /dev/urandom | ascii85 | tr -d '<~>' | sed -e '$a\'
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
