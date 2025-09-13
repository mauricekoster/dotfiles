export black='\e[0;30m'
export BLACK='\e[1;30m'
export BACK_black='\e[40m'

export red='\e[0;31m'
export RED='\e[1;31m'
export BACK_red='\e[41m'

export green='\e[0;32m'
export GREEN='\e[1;32m'
export BACK_green='\e[42m'

export yellow='\e[0;33m'
export YELLOW='\e[1;33m'
export BACK_yellow='\e[43m'

export blue='\e[0;34m'
export BLUE='\e[1;34m'
export BACK_blue='\e[44m'

export magenta='\e[0;35m'
export MAGENTA='\e[1;35m'
export BACK_magenta='\e[45m'

export cyan='\e[0;36m'
export CYAN='\e[1;36m'
export BACK_cyan='\e[46m'

export white='\e[0;37m'
export WHITE='\e[1;37m'
export BACK_white='\e[47m'

# 38, 39 unused/not defined/does not exit/is same as white
export NC='\e[0m'              # No Color

getcols() {
	echo "$2"
}

export COLS="`stty size 2> /dev/null`"
export COLS="`getcols ${COLS}`"
export COLS=$((${COLS} - 1))

export TITLEBRD=$'\e[0;32m'
export TITLECLR=$'\e[1;32m'
export GOOD=$'\e[32;01m'
export WARN=$'\e[33;01m'
export BAD=$'\e[31;01m'
export DEBUGCLR=$'\e[34;01m'
export NORMAL=$'\e[0m'
export HILITE=$'\e[36;01m'
export BRACKET=$'\e[34;01m'