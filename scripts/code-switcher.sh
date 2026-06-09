code_projects_dir="$HOME/Documents/REPO/"

cd "$code_projects_dir" || echo "something went wrong while switching cwd with 'cd' command" && exit

gotodir=$(ls | fzf)

if [[ -d "./$gotodir" ]]; then
  cd "$gotodir" || echo "something went wrong while switching cwd with 'cd' command" && exit
 fi
