#!/usr/bin/env bash
# Split-window that stays inside a devcontainer when the source pane is in one (@devc,
# set by `dce`). Usage: tmux-split.sh -h|-v <pane_id>
flag=$1 src=$2
devc=$(tmux display -p -t "$src" '#{@devc}')
if [[ -n $devc ]]; then
  tmux split-window "$flag" -t "$src" -c "$devc" "$HOME/.local/bin/dce '$devc'; exec bash"
else
  tmux split-window "$flag" -t "$src" -c "$(tmux display -p -t "$src" '#{pane_current_path}')"
fi
