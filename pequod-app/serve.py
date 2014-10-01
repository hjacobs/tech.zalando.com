#!/usr/bin/env python3
import os
import cherrypy

PATH = os.path.abspath(os.path.dirname(__file__))
class Root(object): pass

cherrypy.server.socket_port = 8000
cherrypy.server.socket_host = '::'
config={
            '/': {
                    'tools.staticdir.on': True,
                    'tools.staticdir.dir': PATH,
                    'tools.staticdir.index': 'index.html',
                  },
                }

cherrypy.quickstart(Root(), config=config)
