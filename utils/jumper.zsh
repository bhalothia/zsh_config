autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

function jump {
  local cmd="$1"
  case "$cmd" in
    '.')
      shift;
      local dir_query="$*"
      local dir="$(find . -type d -maxdepth 1 -mindepth 10 | sed 's|^\./\(.*\)|\1|' | fzf --tac --height 10 --reverse --header='<directory>' --query "$dir_query" --select-1 --exit-0)"
      if [ -n "$dir" ]; then
        builtin cd "$dir"
      else
        echo "no directory matches"
        return 1
      fi
      ;;
    '..')
      shift;
      local pwd_list=('/' ${(s:/:)PWD%/*})
      local indexed_pwd_list=()
      for pwd_part_index in $(seq 1 ${#pwd_list}); do
          indexed_pwd_list[$pwd_part_index]="$pwd_part_index $pwd_list[$pwd_part_index]"
      done
      local pwd_index="$(printf "%s\n" "${indexed_pwd_list[@]}" | fzf --tac --height 10 --reverse --header='<directory>' --with-nth=2.. | awk '{print $1}')"
      if [ -n "$pwd_index" ]; then
        local dir_list=(${pwd_list:0:$pwd_index})
        local dir="${(j:/:)dir_list}"
        builtin cd "$dir"
      else
        echo "no directory matches"
        return 1
      fi
      ;;
    '-')
      shift;
      builtin cd -
      ;;
    *)
      local dir_query="$@"
      local dir="$(cdr -l | awk '{$1=""; print $0}' | fzf  --height 10 --reverse --header='<directory>' --query "$dir_query" --select-1 --exit-0)"
      if [ -n "$dir" ]; then
        eval "builtin cd ${dir}"
      else
        echo "no directory matches"
        return 1
      fi
      ;;
  esac
}