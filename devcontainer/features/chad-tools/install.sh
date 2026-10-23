#!/usr/bin/env bash
# Binaries only; config comes from devcontainer/install.sh (dotfiles step).
set -euo pipefail

apt-get update
apt-get install -y --no-install-recommends \
    curl ca-certificates git build-essential unzip \
    ripgrep fd-find fzf bat direnv zoxide ncurses-term
ln -sf /usr/bin/fdfind /usr/local/bin/fd
ln -sf /usr/bin/batcat /usr/local/bin/bat
rm -rf /var/lib/apt/lists/*

case "$(uname -m)" in
    aarch64) nvim_arch=arm64; lg_arch=arm64 ;;
    x86_64) nvim_arch=x86_64; lg_arch=x86_64 ;;
    *) echo "unsupported arch $(uname -m)"; exit 1 ;;
esac

curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${nvim_arch}.tar.gz" | tar -xz -C /opt
ln -sf "/opt/nvim-linux-${nvim_arch}/bin/nvim" /usr/local/bin/nvim

curl -fsSL https://starship.rs/install.sh | sh -s -- -y

lg_version=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p')
curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${lg_version}/lazygit_${lg_version}_Linux_${lg_arch}.tar.gz" \
    | tar -xz -C /usr/local/bin lazygit
