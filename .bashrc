# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

export VISUAL=nvim
export EDITOR=nvim

# path configuation
PATH="${PATH:+${PATH}:}"$SCRIPTS":"$HOME"/.local/bin:$HOME/dotnet" # appending

# manually add bash to path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# silence zsh warning on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# add Go to path
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/opt/homebrew/bin

[[ -f ~/.bash_wd ]] && source ~/.bash_wd

eval "$(starship init bash)"
alias v=nvim
alias vi=nvim
alias ..="cd .."
alias l="ls -lah"

# set aliases
function gacp() {
  git add .
  git commit -m "$1"
  git push origin HEAD
}
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gco="git checkout"
# alias gpsup="git push --set-upstream origin $(git branch)"
alias gfa="git fetch --all --prune"

alias cpbranch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | pbcopy"
alias cppwd="pwd | pbcopy"
alias cpip="curl ifconfig.me | pbcopy"
alias sb='source ~/.bashrc'
alias st='source ~/.tmux.conf'
alias eb='v ~/.bashrc'
alias tf='terraform'
alias d='docker'
alias d='docker-compose'

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(direnv hook bash)"

# manually export LANG such that blesh does not complain
# export LANG=en_US.UTF-8
# export LANGUAGE=en
# source ~/.local/share/blesh/ble.sh
