#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Script to convert Wordpress tags to canonical format
'''

import glob
import os


def prettify(tag):
    if tag.lower() == tag:
        return tag.capitalize()
    return tag


# for fn in glob.glob('*.meta'):
#    with open(fn) as fd:
#        lines = fd.readlines()
#    words = map(prettify, lines[3].split(','))
#    lines[3] = ','.join(words)
#    print lines
#    with open(fn, 'wb') as fd:
#        fd.writelines(lines)

for fn in glob.glob('*.md'):
    meta_fn = fn[:-2] + 'meta'
    if os.path.exists(meta_fn):
        with open(meta_fn) as fd:
            lines = fd.readlines()
        with open(fn) as fd:
            oldcontent = fd.read()
        with open(fn, 'wb') as fd:
            fd.write('<!--\n')
            fd.write('''
.. title: {}
.. slug: {}
.. date: {}
.. tags: {}
.. author: ToDo
'''.format(*[ l.strip() for l in lines]))
            fd.write('-->\n')
            fd.write(oldcontent)
