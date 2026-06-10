#!/usr/bin/env bash
# Generates tmux pane border info: parent/cwd | repo | branch
dir="$1"
path=$(echo "$dir" | rev | cut -d/ -f1-2 | rev)
repo=$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null)
if [ -n "$repo" ]; then
    repo=$(basename "$repo")
    branch=$(git -C "$dir" symbolic-ref --short HEAD 2>/dev/null || echo "-")
    echo "${path} | ${repo} | ${branch}"
else
    echo "${path} | - | -"
fi
