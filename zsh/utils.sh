# git init --bare $HOME/.dotfiles
# dot config --local status.showUntrackedFiles no
# git clone --bare <remote-git-repo-url> $HOME/.dotfiles
# dot checkout
# dot add -f ./
# dot config --local core.excludesFile <path to your gitignore>
# https://gist.github.com/ennanco/d1c6a228f5aac23a3af6592135f0f8ae
# https://coffeeaddict.dev/how-to-manage-dotfiles-with-git-bare-repo/
dot() {
  git --git-dir="${DOT_REPO:-${HOME}/.dotfiles}" \
    --work-tree="${DOT_DATA:-${HOME}/.config}" \
    "$@"
}

# sudo apt update && sudo apt install -y ruby-ascii85
# или openssl rand -base64 $1 | tr -d '=' | tr '+/' '-_'
# несколько паролей `for i in {1..${n:-10}}; do genpswd; done`
# 5 ascii символов для представления 4 байт, то есть пароль будет на 25% длинее запрощенного числа байт
genpswd() {
  head -c "${1:-16}" /dev/urandom | ascii85 | tr -d '<~>' | sed -e '$a\'
}

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# mvn-project ~/Development/jvm/drafts imvconv
mvn-project() {
  group_id="ru.senioravanti"

  # парсим опции
  POSITIONAL_ARGS=()

  while [[ $# -gt 0 ]]; do
    case $1 in
      -G|--group)
        group_id="$2"
        shift # past argument
        shift # past value
        ;;
      -*|--*)
        echo "Unknown option \`$1\`"
        return 1
        ;;
      *)
        POSITIONAL_ARGS+=("$1") # save positional arg
        shift # past argument
        ;;
    esac
  done

  set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

  # парсим позиционные параметры
  if [ ! -d "$1" ]; then
    echo 'project dir does not exist'
    return
  fi
  artifact_id="${2#./}"
  if [ -z "${artifact_id}" ]; then
    echo 'artifact id is empty'
    return
  fi

  old=$(pwd)
  cd "$1"
  mvn archetype:generate \
    -DarchetypeCatalog=local \
    -DgroupId="${group_id}" \
    -DartifactId="${artifact_id}" \
    -Dversion=1.0.0 \
    -DarchetypeGroupId=ru.senioravanti \
    -DarchetypeArtifactId=archetype \
    -DarchetypeVersion=1.0.0 \
    -DinteractiveMode=false
  if [ "$?" -ne 0 ]; then
    cd -
    rm -r "./$2"
    return
  fi
  cd "./$2"
  rm -rf ./.mvn
  git init
  git branch -m main
  git add .
  git commit -m 'chore: init repo'
  cd "${old}"
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

prettify() {
  printf '%s' "$1" \
    | sed -E ':a;N;$!ba;s/\r//g' \
    | sed -E 's/[\x00-\x1F]//g' \
    | jq
}

# https://gist.github.com/thomasdarimont/46358bc8167fce059d83a1ebdb92b0e7
decode_jwt() {
  echo -n "$1" \
    | cut -d '.' -f 2 \
    | tr '_-' '/+' \
    | base64 -d | jq
}
