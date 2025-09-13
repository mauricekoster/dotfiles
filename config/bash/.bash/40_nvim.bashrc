echo "NVIMS"

function nvims() {
  # items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  items=("default")
  arr=(${HOME}/.config/nvim-*)
  for item in ${arr}; do
    name=$(basename ${item})
    echo "> ${name}"
    items+=("${name}")
  done

  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  # NVIM_APPNAME=$config nvim $@
  export NVIM_APPNAME=$config
  echo "Selected: ${config:-default}"
}
echo "nvims done"
bind -x '"\C-n": nvims'
