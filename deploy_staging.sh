#!/bin/bash

echo 'Deploying to http://proxy.zalando.net/tech.zalando.com-nikola/ ..'
rsync -av -4 --no-owner --no-group --no-perms output/ root@iftp.zalando.net:/data/zalando/iftp.zalando.net/htdocs/tech.zalando.com-nikola/
