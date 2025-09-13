#! /bin/bash

has() {
  command -v "$1" 1>/dev/null 2>&1
}

mystow() {
	pushd ${MKO_PATH}/config 2>&1 >/dev/null
	stow --target=${HOME} "$1"
	popd 2>&1 >/dev/null
}
