#! /bin/bash

has() {
  command -v "$1" 1>/dev/null 2>&1
}

mypushd() {
	command pushd "$1" 2>&1 > /dev/null
}

mypopd() {
	command popd 2>&1 >/dev/null
}

mystow() {
	mypushd ${MKO_PATH}/config
	stow --target=${HOME} "$1"
	mypopd
}
