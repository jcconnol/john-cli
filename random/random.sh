#!/bin/bash

random_picking() {
    valid_options=("fact" "number" "num")

    if [ $1 == "fact" ]; then
        random_fact_json=$(curl -s "https://uselessfacts.jsph.pl/api/v2/facts/random")
        echo $(echo "$random_fact_json" | jq -r '.text')
    elif [[ $1 == "number" || $1 == "num" ]]; then
        echo $((1 + $RANDOM % 10))
    else
        echo "Invalid option: '$1'"
        echo "Valid options are: ${valid_options[*]}"
        exit 1
    fi
}
