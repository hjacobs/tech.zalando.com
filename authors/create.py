import json
from nikola.utils import slugify

with open('temp.json') as fd:
    data = json.load(fd)


for row in data:
    title, text= [ x.strip() for x in row.split('||') ]
    text, stuff = text.split('Published Posts')
    slug = slugify(title)
    with open(slug + '.rst', 'wb') as fd:
        fd.write(u'''.. title: {title}
.. slug: {slug}
.. date: 2014/02/18 16:58:00
.. tags:
.. link:
.. description:
.. type: text

{text}'''.format(title=title, slug=slug, text=text).encode('utf-8'))
