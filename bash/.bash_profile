# Add correct Homebrew to PATH depending on machine
if [[ -d "/opt/homebrew/bin" ]]; then
  # M1/M2 Mac (ARM)
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d "/usr/local/bin" ]]; then
  # Intel Mac (x86)
  eval "$(/usr/local/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
