code_project_dir="$HOME/Documents/REPO/"

cd $code_project_dir

gotodir=$(ls | fzf)

if [[ -d "./$gotodir" ]]; then
  cd $gotodir
fi
