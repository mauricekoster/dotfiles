# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

if [ -z "$USER" ]; then
    USER=${USERNAME:-"<user>"}
fi

# if [ -f /etc/bashrc ]; then
#         . /etc/bashrc   # --> Read /etc/bashrc, if present.
# fi

# extend the path to contain possible location of
# bash libraries
export BASH_LIB_PATH=${BASH_LIB_PATH:-$HOME/.config/bash}
export PATH=$PATH:$BASH_LIB_PATH

export HOSTFILE=$HOME/.hosts	# Put a list of remote hosts in ~/.hosts
export HOST=${HOST:-`uname -n`}

# This function will source foo or foo.bash
function source ()
{
#	echo "Bashlib path: $PATH"
	command source $* 2>/dev/null
	if [ $? -eq 1 ]; then
		S="$1.bash"
#        echo "    $S"
		shift
		command source $S $* 2>/dev/null
	fi
}
declare +x source

##
# _source all *.bashrc files
function dorc ()
{
    local P=$1
    shift
    if [ "$*" != "" ]; then
        dorc $*
    fi
    #echo "Sourcing $P"
    for SOURCE in $P/*.bashrc
    do
        #echo "    $SOURCE"
        source $SOURCE 2>/dev/null
    done
}
dorc ${BASH_LIB_PATH//:/ }

# Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.bash

# Aliases
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias grep='grep --color=auto'
alias grubup="sudo update-grub"
alias hw='hwinfo --short'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias psmem='ps auxf | sort -nr -k 4'
alias rmpkg="sudo pacman -Rdd"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias upd='/usr/bin/update'
alias vdir='vdir --color=auto'
alias wget='wget -c '

# Help people new to Arch
alias apt-get='man pacman'
alias apt='man pacman'
alias helpme='cht.sh --shell'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns `pacman -Qtdq`'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$HOME/.jbang/currentjdk/bin:$PATH"
export JAVA_HOME=$HOME/.jbang/currentjdk

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=/home/maurice/.bun/bin:/home/maurice/.jbang/bin:/home/maurice/.jbang/currentjdk/bin:/home/maurice/.pyenv/plugins/pyenv-virtualenv/shims:/home/maurice/.pyenv/shims:/home/maurice/.pyenv/bin:/home/maurice/.nvm/versions/node/v20.11.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/maurice/.config/bash:/home/maurice/bin:/home/maurice/.local/bin:/home/maurice/dotfiles/bin:/home/maurice/.local/lab/bin
