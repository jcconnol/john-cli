script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $script_dir/gitlab_mr.sh

commit() {
    echo "working on committing"
    echo $(pwd)

    current_branch=$(git branch --show-current)

    git add .
    git commit -m "$1"
    git push --set-upstream origin $current_branch

    make_gitlab_mr
}
