.PHONY: vim nvim tmux fonts install

vim: 
	ln -sf $(PWD)/.vimrc ~/.vimrc

nvim:
	ln -sf $(PWD)/nvim ~/.config/nvim

tmux:
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

# linux only
fonts:
	mkdir -p $HOME/.local/share/fonts
	cp $PWD/fonts/UbuntuMono* $HOME/.local/share/fonts

install: vim nvim tmux
