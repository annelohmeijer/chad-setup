#!/usr/bin/env bash
# Open nvim or a shell at the last .../github/... path (~ or absolute) printed in a pane (e.g. a worktree Claude made).
# Usage: tmux-open.sh split|window|term|term-window <pane_id>
mode=$1 src=$2
path=$(tmux capture-pane -p -J -S -3000 -t "$src" | grep -oE "[~A-Za-z0-9._/-]*/github/[A-Za-z0-9._/-]+" | tail -1)
[[ -z $path ]] && { tmux display-message "tmux-open: no /github/ path in pane"; exit; }
path=${path/#\~/$HOME}
path=${path%"${path##*[!./]}"}  # drop trailing "." or "/" (sentence end)
while [[ ! -d $path && $path == */github/* ]]; do path=${path%/*}; done # file or trailing junk -> nearest dir
[[ -d $path ]] || { tmux display-message "tmux-open: $path does not exist"; exit; }
dir=$(git -C "$path" rev-parse --show-toplevel 2>/dev/null || echo "$path")
case $mode in
  window) tmux new-window -c "$dir" nvim ;;
  term) tmux split-window -h -t "$src" -c "$dir" ;;
  term-window) tmux new-window -c "$dir" ;;
  *) tmux split-window -h -t "$src" -c "$dir" nvim ;;
esac
