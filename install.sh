#!/bin/bash

if [[ "$OSTYPE" == "win32" ]]; then
    for s in ./windows/*.ps1; do
        pwsh $s
    done
else
    ./linux/link.sh
    sudo bash ./linux/systemd.sh
fi

for s in ./cross_platform/*.sh; do
    $s
done
