#!/usr/bin/python2

# a script to check for possible optimization of QStringList usage

import os, re

regex = re.compile('QStringList (.[^\\s|;|(]+)')

for root, dirs, files in os.walk(os.getcwd()):
    for sfile in files:
        if not sfile.endswith(('.hpp', '.h', '.hh', '.cpp', '.c', 'cc')):
            continue
        sfull = '%s/%s' % (root, sfile)
        with open(sfull, 'rb') as f:
            content = f.read()
        for match in regex.findall(content):
            if ('%s.append(' % match in content or '%s.prepend(' % match in content) \
                and not '%s.reserve(' % match in content:
                print('possible optimzation of %s in %s' % (match, sfull.replace('%s/' % os.getcwd(), ""))) 
