#!/bin/bash

# Function to search specific directories using fzf
search_directories() {
    # Define the directories to search
    directories=(~/code ~/class ~/dotfiles ~/Downloads ~/Desktop)
    
    # Use find to search in specified directories and combine with home directory
    selected_dir=$(
        (
            echo "$HOME"
            find "${directories[@]}" -type d 2>/dev/null
        ) | sort -u | fzf --layout=reverse --height 40%
    )
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        $SHELL
    fi
}

# Run the function
search_directories


# Before home modification
# #!/bin/bash
# # Function to search specific directories using fzf
# search_directories() {
#     # Define the directories to search
#     directories=(~/code ~/class ~/dotfiles ~/Downloads ~/Desktop)
#
#     # Use find to search only in specified directories and pipe to fzf
#     selected_dir=$(find "${directories[@]}" -type d 2>/dev/null | fzf --layout=reverse --height 40%)
#
#     if [ -n "$selected_dir" ]; then
#         cd "$selected_dir"
#         $SHELL
#     fi
# }
# # Run the function
# search_directories
