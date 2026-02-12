# Chad setup

## Introduction

This repo contains the config files for a CLI-centered, developer setup / DevOps workflow. No tools outside the terminal should be needed.The core components consist of:

- Terminal: Alacritty
- Editor: Nvim with lazyvim (Lua etc).
- In-terminal window management: Tmux 

All config files are symlinked with the location where they are actually picked up from by the tool in question (mainly ~), see Makefile for install scripts.

## Prompting style

When fixing things, always go for builtin commands and short keys as much as possible. Only use custom additions when needed. Apart from this, when applicable give additional tips for short cuts for the plugins that I use most. These are, among others, but not limited to, the following nvim plugins:

- Telescope
- Harpoon
- Avante
- Gitlinker

Finally, don't be afraid to suggest other useful tools that might be useful when developing (either Terraform, Python, Bash, Markdown).

