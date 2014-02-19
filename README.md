Zalando Technology public "Tech Blog"
=====================================

This repository contains the source files for our public Tech Blog (tech.zalando.com).

The latest version of generated static HTML is always on https://proxy.zalando.net/tech.zalando.com-nikola/

Writing blog posts
------------------

Create (or copy) a ".rst" file in the "posts" folder.
All new blog posts will be written in plain text reStructured Text format (very similar to Markdown, but extensible and therefore more powerful):

* http://docutils.sourceforge.net/rst.html
* http://sphinx-doc.org/rest.html
* http://getnikola.com/quickstart.html

Please make sure your blog post contains all necessary meta information (in the header):

* author name ("..author: Henning Jacobs")
* teaser image ("..image: my-example-image.jpg")


Getting started on Ubuntu
-------------------------

First install Nikola:

    git clone git://github.com/getnikola/nikola.git
    cd nikola
    sudo ./setup.py install
    sudo apt-get install python-dev python-pip python-lxml python-imaging
    sudo pip install -r requirements-full.txt

First build:

    nikola build
    nikola serve

Now point your browser to http://localhost:8000/

Editing files on Windows
------------------------

Please see http://stackoverflow.com/questions/2746692/restructuredtext-tool-support for editor support.
