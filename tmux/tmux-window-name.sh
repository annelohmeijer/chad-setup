#!/usr/bin/env bash
# Generates tmux window name: parentdir/cwd or parentdir/cwd@branch
dir="$1"
name=$(echo "$dir" | rev | cut -d/ -f1-2 | rev)
branch=$(git -C "$dir" symbolic-ref --short HEAD 2>/dev/null)
if [ -n "$branch" ]; then
    echo "${name}@${branch}"
else
    echo "$name"
fi
