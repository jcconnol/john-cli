reaction() {

    # Check if three arguments are provided
    if [ "$#" -ne 3 ]; then
        echo "Usage: $0 reaction <MESSAGE_ID> <API_KEY>"
        exit 1
    fi

    # Assign arguments to variables
    api_key="$2"
    message_id="$1"

    ="${api_base_url}${id}"

    # Define a list of IDs
    reaction_ids=("id1" "id2" "id3")

    # Iterate through the list of IDs and make curl calls
    for id in "${reaction_ids[@]}"; do

        echo "Making a POST request for ID: $id"

        # Replace this line with your curl command
        curl -X POST \
            -H "Authorization: Bearer $api_key" \
            -H "Content-Type: application/json" \
            -d "{\"key\": \"$id\"}" \
            "$api_url"

        # You can also add error handling or further processing here
    done
}
