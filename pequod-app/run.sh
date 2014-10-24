#!/bin/bash

cp -vr /.ssh/ .ssh/
chmod 700 .ssh/*

export GIT_SSH=/git_ssh

echo 'Sleeping 10s..'
sleep 10

echo 'Starting CherryPy HTTP server..'
/serve.py tech.zalando.com-nikola/output/ &

while true; do
    echo 'Cloning git repo..'
    git clone ssh://git@stash.zalando.net:7999/platform/tech.zalando.com-nikola.git
    (
    cd tech.zalando.com-nikola
    echo 'Pulling git repo..'
    git pull
    rm -fr .doit*
    echo 'Building static HTML with Nikola..'
    nikola build
    )
    echo 'Sleeping 45s..'
    sleep 45
done
