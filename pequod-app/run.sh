#!/bin/bash

cp -vr /.ssh/ .ssh/
chmod 700 .ssh/*
ls -la .ssh/*


export GIT_SSH=/git_ssh

echo 'Sleeping 10s..'
sleep 10
/serve.py tech.zalando.com-nikola/output/ &

while true; do
    git clone ssh://git@stash.zalando.net:7999/platform/tech.zalando.com-nikola.git
    (
    cd tech.zalando.com-nikola
    git pull
    nikola build
    )
    echo 'Sleeping 30s..'
    sleep 30
done
