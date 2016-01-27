#!/usr/bin/python2

# a script to check for possible functions inlining/deinlining in headers files

import os, re

regex = re.compile('(.*[\\t| ](.*)\(\).*\{.*return.*\(\).*\})')

for root, dirs, files in os.walk(os.getcwd()):
    for sfile in files:
        if not sfile.endswith(('.hpp', '.h', '.hh')):
            continue
        sfull = '%s/%s' % (root, sfile)
        with open(sfull, 'rb') as f:
            content = f.read()
        for match in regex.findall(content):
            if 'inline' in match[0]:
                print('possible removal of %s in %s'  % (match[1], sfull.replace('%s/' % os.getcwd(), "")))
                continue
            elif 'const' in match[0] or 'virtual' in match[0]:
                continue
            print('possible inlining of %s in %s' % (match[1], sfull.replace('%s/' % os.getcwd(), "")))
