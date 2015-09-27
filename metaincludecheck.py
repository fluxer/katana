#!/usr/bin/python2

# a script to check for Qt4 meta-headers inclusion in source files

import os, re

metaheaders = (
    'Qt',
    'Qt3Support',
    'QtCore',
    'QtDBus',
    'QtDeclarative',
    'QtDesigner',
    'QtGui',
    'QtHelp',
    'QtMultimedia',
    'QtNetwork',
    'QtOpenGL',
    'QtScript',
    'QtScriptTools',
    'QtSql',
    'QtSvg',
    'QtTest',
    'QtUiTools',
    'QtWebKit',
    'QtXml',
    'QtXmlPatterns'
)

for root, dirs, files in os.walk(os.getcwd()):
    for sfile in files:
        if not sfile.endswith(('.hpp', '.h', '.cpp', '.c')):
            continue
        sfull = '%s/%s' % (root, sfile)
        with open(sfull, 'rb') as f:
            content = f.read()
        for header in metaheaders:
            for match in re.findall('\n#(?:[\\s]+)?include [<|"](?:%s|%s/%s|%s/%s.h|%s.h)[>|"]\n' % \
                (header, header, header, header, header.lower(), header.lower()), content):
                print('meta header %s included in %s' % (header, sfull.replace('%s/' % os.getcwd(), "")))
