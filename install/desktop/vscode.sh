#! /bin/bash

EXTENSIONS=(
    "alexkrechik.cucumberautocomplete"
    "arcticicestudio.nord-visual-studio-code"
    "bradlc.vscode-tailwindcss"
    "djsaunders1997.uv-wingman"
    "docker.docker"
    "mechatroner.rainbow-csv"
    "ms-azuretools.vscode-containers"
    "ms-azuretools.vscode-docker"
    "ms-playwright.playwright"
    "ms-python.debugpy"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.vscode-python-envs"
    "ms-vscode-remote.remote-containers"
    "ms-vscode.hexeditor"
    "redhat.vscode-yaml"
    "ritwickdey.liveserver"
    "robocorp.robotframework-lsp"
    "sumneko.lua"
    "tamasfe.even-better-toml"
    "yy0931.vscode-sqlite3-editor"
)


if ! has code; then

    # make config directory
    mkdir -p $HOME/.config/Code/User

    wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

    # install vscode
    sudo apt install -y ./code.deb
    rm -f code.deb

    # install extensions
    for extension in "${EXTENSIONS[@]}"
    do
        code --install-extension --force "$extension"
    done

    # config
    mystow vscode
fi