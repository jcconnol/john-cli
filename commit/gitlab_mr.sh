make_gitlab_mr() {
    # GitLab Project URL
    current_repo_name=$(basename $(git rev-parse --show-toplevel))

    project_base_url="https://gitlab.com/your_username/"

    project_data=$(curl --header "PRIVATE-TOKEN: $access_token" "$project_base_url/api/v4/projects?search=$current_repo_name")
    project_id=$( $project_data | jq -r '.[0].id')

    access_token="$JOHN_GITLAB_TOKEN"

    source_branch="feature_branch"
    target_branch="master"
    mr_title="Merge Request Title"
    mr_description="This is the description of the merge request."

    curl \
        --request POST \
        --header "PRIVATE-TOKEN: $access_token" \
        --data "source_branch=$source_branch" \
        --data "target_branch=$target_branch" \
        --data "title=$mr_title" \
        --data "description=$mr_description" \
        "$project_base_url/merge_requests"
}
