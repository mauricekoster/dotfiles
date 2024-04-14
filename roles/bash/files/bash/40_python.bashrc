echo  Python stuff

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#/home/maurice/.pyenv/plugins/pyenv-virtualenv/shims:/home/maurice/.pyenv/shims:/home/maurice/.pyenv/bin

export PYTHONPATH=${HOME}/library/python:${PYTHONPATH}
