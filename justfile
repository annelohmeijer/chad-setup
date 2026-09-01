set shell := ["bash", "-uc"]

root := justfile_directory()

default:
    @just --list

vim:
    ln -sf {{root}}/.vimrc ~/.vimrc

nvim:
    rm -rf ~/.config/nvim
    ln -sf {{root}}/nvim ~/.config/nvim

tmux:
    ln -sf {{root}}/.tmux.conf ~/.tmux.conf
    mkdir -p ~/.config/tmux
    ln -sf {{root}}/tmux/tmux-window-name.sh ~/.config/tmux/tmux-window-name.sh
    ln -sf {{root}}/tmux/tmux-pane-border.sh ~/.config/tmux/tmux-pane-border.sh
    test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

alacritty:
    git submodule update --init --recursive
    rm -rf ~/.config/alacritty
    ln -sf {{root}}/alacritty ~/.config/alacritty

bash:
    ln -sf {{root}}/bash/.bashrc ~/.bashrc
    mkdir -p ~/.local/bin
    ln -sf {{root}}/bash/git-clean-worktrees ~/.local/bin/git-clean-worktrees
    ln -sf {{root}}/bash/git-acp ~/.local/bin/git-acp

symlink: vim nvim tmux alacritty bash

# linux only
fonts:
    mkdir -p ~/.local/share/fonts
    cp {{root}}/fonts/UbuntuMono* ~/.local/share/fonts

install:
    brew update
    brew install -f \
        just tmux neovim lazygit ripgrep alacritty \
        vim luarocks raycast \
        zoxide fzf direnv \
        pyenv
    brew install --cask obsidian
    brew install --cask font-ubuntu-mono-nerd-font
    just alacritty
