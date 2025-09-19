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
    echo "TODO: VSCODE"

    # make config directory
    mkdir -p $HOME/.config/Code/User

    wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64

    # install vscode
    DEB=$(ls -1 code_*.deb | head 1)
    sudo apt install -y ./$DEB
    rm $DEB

    # install extensions
    for extension in "${EXTENSIONS[@]}"
    do
        code --install-extension --force "$extension"
    done

    # config
    mystow vscode
fi