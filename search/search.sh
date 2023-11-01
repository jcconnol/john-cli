search() {
    echo "Opening browser"
    search_query="$1"

    # Construct the search URL
    search_url="https://www.google.com/search?q=${search_query// /+}"
    start "$search_url"
}
