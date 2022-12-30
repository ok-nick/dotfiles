#!/usr/bin/bash

if [[ "$OSTYPE" == "win32" ]]; then
    for s in ./windows/*.ps1; do
        pwsh $s
    done
else
    for s in ./linux/*.sh; do
        $s
    done
fi

for s in ./cross_platform/*.sh; do
    $s
done
