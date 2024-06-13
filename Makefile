.PHONY: vim nvim tmux alacritty fonts install

vim: 
	ln -sf $(PWD)/.vimrc ~/.vimrc

nvim:
	rm -rf ~/.config/nvim
	ln -sf $(PWD)/nvim ~/.config/nvim

tmux:
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

alacritty:
	rm -rf ~/.config/alacritty
	ln -sf $(PWD)/alacritty ~/.config/alacritty

# linux only
fonts:
	mkdir -p $(HOME)/.local/share/fonts
	cp $(PWD)/fonts/UbuntuMono* $(HOME)/.local/share/fonts

install: vim nvim tmux alacritty
