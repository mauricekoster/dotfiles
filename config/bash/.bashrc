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
export BASH_LIB_PATH=${BASH_LIB_PATH:-$HOME/.bash}
export PATH=$PATH:$BASH_LIB_PATH

export HOSTFILE=$HOME/.hosts # Put a list of remote hosts in ~/.hosts
export HOST=${HOST:-$(uname -n)}

has() {
  command -v "$1" 1>/dev/null 2>&1
}


##
# _source all *.bashrc files
# function dorc() {
#   local P=$1
#   shift
#   if [ "$*" != "" ]; then
#     dorc $*
#   fi
#   echo "Sourcing $P"
#   for SOURCE in $P/*.bashrc; do
#     echo "    $SOURCE"
#     source $SOURCE 2>/dev/null
#     #read -p "Pause. Hit Enter"    
#   done
# }
# dorc ${BASH_LIB_PATH//:/ }

for resource in $HOME/.bash/*.bashrc; do 
    echo ">> ${resource}"
    source $resource
done

#export PATH=${PATH}:${HOME}/.local/lab/bin

#if [ -f ~/.bash_aliases ]; then
#  . ~/.bash_aliases
#
#fi

#source /home/maurice/.pyenv/.pyenvrc

# # Local Variables:
# # mode:shell-script
# # sh-shell:bash

# # TODO: Everything below, should be checked and moved to own .bashrc file


#source '/home/maurice/.bash_completions/pp.sh'

