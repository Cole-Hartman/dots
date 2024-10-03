#!/bin/bash

# Function to search specific directories using fzf
search_directories() {
    # Define the directories to search
    directories=(~/code ~/class ~/dotfiles ~/Downloads ~/Desktop)
    
    # Use find to search only in specified directories and pipe to fzf
    selected_dir=$(find "${directories[@]}" -type d 2>/dev/null | fzf --layout=reverse --height 40%)
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        $SHELL
    fi
}

# Run the function
search_directories
