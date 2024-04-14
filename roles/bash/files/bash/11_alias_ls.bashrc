if [ -x "/home/linuxbrew/.linuxbrew/bin/eza" ]; then
  alias ls='eza -h --icons=auto'
  alias lr='eza -lR' 
  alias ll='ls -l'
  alias la='ls -Al'
  alias lg='ls -l --git'
  alias tree='eza -T'

else
  alias la='ls -Al'               # show hidden files

  # add colors for filetype recognition
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -hF --color=auto'
    else
        alias ls='ls -hF'
    fi

  alias lr='ls -lR'               # recursive ls
  alias lt='ls -ltr'              # sort by date
  alias ll='ls -l'  # long list
  alias l='ls -C'

  if has tree; then
    alias tree='tree -Csu'		# nice alternative to 'ls'
  fi
fi
