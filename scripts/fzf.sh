#!/bin/bash

# Function to search directories using fzf
search_directories() {
    selected_dir=$(find ~/ -type d | fzf --layout=reverse --height 40%)
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        $SHELL
    fi
}

# Run the function
search_directories

