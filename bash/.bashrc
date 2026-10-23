# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

# vi-mode `v` edits the command line in nvim, but nvim takes the whole pane so your
# eyes jump to the top. Edit in a tmux popup pinned to the bottom 15 rows instead.
# -x P / -y P = pane left / pane bottom, so the popup covers the pane only, not the client.
# ponytail: plain VISUAL=nvim stays the editor for git/crontab/etc.
# ponytail: READLINE_LINE needs bash >= 4; Apple's /bin/bash is 3.2, where `v` keeps
# the builtin full-screen edit-and-execute instead of silently losing the line.
if ((BASH_VERSINFO[0] >= 4)); then
  __vi_edit_cmdline() {
    local f
    f=$(mktemp) || return
    printf '%s\n' "$READLINE_LINE" >"$f"
    if [[ -n $TMUX ]]; then
      tmux display-popup -E -w "$(tmux display -p '#{pane_width}')" -h 15 -x P -y P -T ' cmdline ' nvim "$f"
    else
      "${VISUAL:-${EDITOR:-vi}}" "$f"
    fi
    READLINE_LINE=$(<"$f")
    READLINE_POINT=${#READLINE_LINE}
    rm -f "$f"
  }
  bind -m vi-command -x '"v": __vi_edit_cmdline'
fi

# fat plain-bash history as fallback for boxes without atuin (default was 500)
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
shopt -s histappend

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

command -v starship >/dev/null && eval "$(starship init bash)"
# -w logs every keystroke (builtin) for vim-habit analysis; local file only
alias v='nvim -w ~/.local/state/nvim/keys.log'
alias vi='nvim -w ~/.local/state/nvim/keys.log'
alias nv='nvim -w ~/.local/state/nvim/keys.log'
alias ..="cd .."
alias l="ls -lah"
alias cr=cresume

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

function gwa() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "Usage: gwa <branch-name>"
    return 1
  fi
  local dir="../${branch//\//-}"
  git worktree add "$dir" -b "$branch" &&
    cp .env "$dir/.env" 2>/dev/null &&
    cd "$dir" &&
    direnv allow
}

alias cpbranch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | pbcopy"
alias cppwd="pwd | pbcopy"
alias cpip="curl ifconfig.me | pbcopy"
# attach to tmux with independent view (no mirroring)
function ta() {
  local target="${1:-main}"
  if ! tmux has-session -t "$target" 2>/dev/null; then
    tmux new-session -s "$target"
  else
    tmux new-session -t "$target"
  fi
}

function ?() {
  w3m "https://duckduckgo.com/lite?q=$(echo "$*" | sed 's/ /+/g')"
}

function ??() {
  claude -p "$*"
}
alias sb='source ~/.bashrc'
alias st='source ~/.tmux.conf'
alias eb='v ~/.bashrc'
alias ec='v ~/.claude/CLAUDE.md'
alias da='direnv allow'

alias tf='terraform'
alias d='docker'
alias dc='docker compose'
alias ld='lazydocker'
alias lg='lazygit'

# atuin: `h` = same UI as ctrl-r, but prefilled: `h openssl`
alias h='atuin search -i'

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

command -v direnv >/dev/null && eval "$(direnv hook bash)"
command -v zoxide >/dev/null && eval "$(zoxide init bash)"

# manually export LANG such that blesh does not complain
# export LANG=en_US.UTF-8
# export LANGUAGE=en
# source ~/.local/share/blesh/ble.sh

# restore terminal echo after aborted programs (e.g. uvicorn --reload)
PROMPT_COMMAND="stty sane; $PROMPT_COMMAND"

# atuin: ctrl-r searches every command you ever ran, with dir/exit-code/duration.
# bash-preexec MUST be sourced after anything else that touches PROMPT_COMMAND.
[ -f /opt/homebrew/etc/profile.d/bash-preexec.sh ] && . /opt/homebrew/etc/profile.d/bash-preexec.sh
command -v atuin >/dev/null && eval "$(atuin init bash --disable-up-arrow)"
