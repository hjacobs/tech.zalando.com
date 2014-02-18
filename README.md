Zalando Technology public "Tech Blog"
=====================================

This repository contains the source files for our public Tech Blog (tech.zalando.com).

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

