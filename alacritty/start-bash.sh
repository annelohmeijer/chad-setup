#!/usr/bin/env bash
# bash sits on different locations in Mac M2 vs Mac Intel so we need a wrapper
# proxy to point to for Alacritty program option otherwise it does not start
if [[ -x /opt/homebrew/bin/bash ]]; then
  exec /opt/homebrew/bin/bash
elif [[ -x /usr/local/bin/bash ]]; then
  exec /usr/local/bin/bash
else
  exec /bin/bash
fi
