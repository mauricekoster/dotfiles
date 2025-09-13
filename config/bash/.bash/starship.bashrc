#! /bin/bash

if has starship; then
    if [ "$XDG_SESSION_TYPE" != "tty" ]; then
        eval "$(starship init bash)"
    fi
fi


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
