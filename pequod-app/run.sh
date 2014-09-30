#!/bin/bash


export GIT_SSH=/git_ssh
git clone ssh://git@stash.zalando.net:7999/platform/tech.zalando.com-nikola.git
cd tech.zalando.com-nikola

python3 -m http.server &

while true; do
    echo 'Sleeping 60s..'
    sleep 60
    git pull
    nikola build
done
