#! /bin/bash

PIPXPACKAGES=(
    "pywal16"
)

for package in "${PIPXPACKAGES[@]}"
do
   pipx install "$package"
done
