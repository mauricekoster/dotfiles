#! /bin/bash


info() {
  echo -e "${BLUE}>${NC} $*"
}

warn() {
  echo -e  "${YELLOW}! $*${NC}"
}

error() {
  echo -e "${RED}x $*${NC}" >&2
}

completed() {
  echo -e "${GREEN}✓${NC} $*"
}

has() {
  command -v "$1" 1>/dev/null 2>&1
}

download() {
  file="$1"
  url="$2"

  if has curl; then
    cmd="curl --fail --silent --location --output $file $url"
  elif has wget; then
    cmd="wget --quiet --output-document=$file $url"
  elif has fetch; then
    cmd="fetch --quiet --output=$file $url"
  else
    error "No HTTP download program (curl, wget, fetch) found, exiting…"
    return 1
  fi

  $cmd && return 0 || rc=$?

  error "Command failed (exit code $rc): ${BLUE}${cmd}${NO_COLOR}"
  printf "\n" >&2
  
  return $rc
}

unpack() {
  archive=$1
  bin_dir=$2
  sudo=${3-}

  case "$archive" in
    *.tar.gz)
      flags=$(test -n "${VERBOSE-}" && echo "-xzvof" || echo "-xzof")
      ${sudo} tar "${flags}" "${archive}" -C "${bin_dir}"
      return 0
      ;;
    *.zip)
      flags=$(test -z "${VERBOSE-}" && echo "-qqo" || echo "-o")
      UNZIP="${flags}" ${sudo} unzip "${archive}" -d "${bin_dir}"
      return 0
      ;;
  esac

  error "Unknown package extension."
  printf "\n"
  return 1
}

function drawline() {
  NR=${1:-79}
  CHAR=${2:-"-"}
  FRONTCOLOR=${3:-${WHITE}}
  BACKCOLOR=${4:-}
  echo -ne "${BACKCOLOR}${FRONTCOLOR}"
  for ((i=0; i<${NR}; i++)); do echo -n ${CHAR}; done
  echo -e "${NC}"
}
declare +x drawline
