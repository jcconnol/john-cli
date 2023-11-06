# run this command to setup everything needed for this cli

output_git_bash_vars() {
    file_append_string="$1"
    file_path="$(realpath ~/.bashrc)"

    append_to_file "$file_path" "$file_append_string"
}

output_zsh_vars() {
    file_append_string="$1"
    file_path=$(realpath ~/.zshrc)

    append_to_file "$file_path" "$file_append_string"
}

append_to_file() {
    file_path="$1"
    file_add_string="$2"

    if [ -f "$file_path" ]; then
        echo -e "$file_add_string" >> "$file_path"
        echo -e "Added vars to $file_path"
    else
        echo -e "The file $file_path doesn't exist."
    fi
}

needed_tokens_json=""

if [ -n "$JOHN_CLI_API_TOKEN" ]; then
    needed_tokens_json=$(curl -H "Content-Type: application/json" -H "x-api-key: $JOHN_CLI_API_TOKEN" "https://vtl2jpfb45.execute-api.us-east-2.amazonaws.com/dev/api/get-params")
else
    echo "No John CLI api token found. Please purchase one."
    echo "set the token as the environment variable \"JOHN_CLI_API_TOKEN\"."
fi

file_output_string='### Auto generated for John CLI ###\n'
file_output_string+="\nexport PATH=\"\$PATH:$(pwd)\"\n"


for item in $(echo "$needed_tokens_json" | jq -c '.params[]'); do
    param_name=$(echo "$item" | jq -r '.name')
    param_value=$(echo "$item" | jq -r '.value')

    file_output_string+="\n"
    file_output_string+="export ${param_name}=\"${param_value}\""
    file_output_string+="\n"
done

file_output_string+='\n### End of John CLI Params ###'


if [[ "$SHELL" == *"bash"* ]]; then
  echo "Current shell is Git Bash"
  output_git_bash_vars "$file_output_string"
elif [[ "$SHELL" == *"/zsh" ]]; then
  echo "Current shell is Zsh"
   output_zsh_vars "$file_output_string"
else
  echo "Current shell is not Git Bash or Zsh"
fi


