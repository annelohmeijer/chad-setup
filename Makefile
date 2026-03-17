.PHONY: vim nvim tmux alacritty fonts install bash

vim: 
	ln -sf $(PWD)/.vimrc ~/.vimrc

nvim:
	rm -rf ~/.config/nvim
	ln -sf $(PWD)/nvim ~/.config/nvim

tmux:
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

alacritty:
	git submodule update --init --recursive
	rm -rf ~/.config/alacritty
	ln -sf $(PWD)/alacritty ~/.config/alacritty

bash:
	ln -sf $(PWD)/bash/.bashrc $(HOME)/.bashrc
	mkdir -p $(HOME)/.local/bin
	ln -sf $(PWD)/bash/git-clean-worktrees $(HOME)/.local/bin/git-clean-worktrees
	ln -sf $(PWD)/bash/git-acp $(HOME)/.local/bin/git-acp

symlink: vim nvim tmux alacritty bash

# linux only
fonts:
	mkdir -p $(HOME)/.local/share/fonts
	cp $(PWD)/fonts/UbuntuMono* $(HOME)/.local/share/fonts

install:
	# chsh -s /bin/bash
	brew update
	brew install -f \
		tmux neovim lazygit ripgrep alacritty \
		vim nvim tmux luarocks raycast \
		zoxide fzf direnv \
		pyenv 
	brew install --cask obsidian
	brew install --cask font-ubuntu-mono-nerd-font
	make alacritty

