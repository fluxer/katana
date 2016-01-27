#!/usr/bin/python2

# a script to check for possible optimization of QString formatter

# if you are going to apply changes make sure you do not mix types,
# the method has several overloads!

import os, re

regex = re.compile('\.arg\(')

for root, ldirs, lfiles in os.walk(os.getcwd()):
    for sfile in lfiles:
        sfull = '%s/%s' % (root, sfile)
        if '/.git/' in sfull:
            continue
        printfile = False
        with open(sfull, 'r') as f:
            for sline in f.readlines():
        if len(regex.findall(sline)) > 1:
            printfile = True
                break
        if printfile:
            print(sfull)
