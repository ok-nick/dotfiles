#!/usr/bin/bash

if [[ "$OSTYPE" == "win32" ]]; then
    pwsh ./windows/install.ps1
else
    ./linux/install.sh
fi

./cross_platform/install.sh
