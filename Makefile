.PHONY: vim nvim tmux install

vim: 
	ln -sf $(PWD)/.vimrc ~/.vimrc

nvim:
	ln -sf $(PWD)/nvim ~/.config/nvim

tmux:
	ln -sf $(PWD)/tmux/.tmux.conf ~/.tmux.conf

install: vim nvim tmux
