if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  echo "BREW"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
