#!/bin/bash

for s in ./systemd/*.service; do
    systemctl daemon-reload

    systemctl start $(basename $s)
    systemctl enable $(basename $s)
done
