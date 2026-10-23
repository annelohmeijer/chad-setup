#!/usr/bin/env bash
# Dotfiles step for devcontainers: `devcontainer up --dotfiles-repository <this repo>
#   --dotfiles-install-command devcontainer/install.sh`. Mirrors `just symlink` for the
# tools that make sense inside a container.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"

mkdir -p ~/.config ~/.config/lazygit ~/.local/bin ~/.local/state/nvim
rm -rf ~/.config/nvim
ln -sf "$root/nvim" ~/.config/nvim
ln -sf "$root/bash/.bashrc" ~/.bashrc
ln -sf "$root/lazygit/config.yml" ~/.config/lazygit/config.yml
