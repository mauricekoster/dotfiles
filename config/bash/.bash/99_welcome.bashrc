#! /bin/bash


drawline ${COLS} "=" ${RED}
if [ -f /etc/os-release ]; then
  source /etc/os-release
  echo -e "${YELLOW}Distributie: ${PRETTY_NAME}${NC}"
fi
# Looks best on a black background.....
drawline ${COLS} "=" ${RED}
echo -e "\n${CYAN}Dit is BASH ${RED}${BASH_VERSION%.*}${NC}\n"
echo -e "${YELLOW}Welkom, `fullname ${USER}`!${NC}\n"
echo -e "${blue}Vandaag is het: ${GREEN}`LC_ALL=nl_NL.utf8 date "+%A, %d %B %Y"`${NC}"
drawline ${COLS} "-" ${RED}

# function _exit()
# {
#     echo -e "${RED}Hasta la vista, baby${NC}"
#     sleep .5
# }
# trap _exit EXIT
