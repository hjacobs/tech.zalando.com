#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
Script to convert Wordpress tags to canonical format
'''

import glob


def prettify(tag):
    if tag.lower() == tag:
        return tag.capitalize()
    return tag


for fn in glob.glob('*.meta'):
    with open(fn) as fd:
        lines = fd.readlines()
    words = map(prettify, lines[3].split(','))
    lines[3] = ','.join(words)
    print lines
    with open(fn, 'wb') as fd:
        fd.writelines(lines)
