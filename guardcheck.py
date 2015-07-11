#!/usr/bin/python2

# a script to sanitize and check for missing guard in public headers

import os, sys, re, glob

kheaders = []
for header in glob.glob('/usr/include/k*.h'):
    kheaders.append(os.path.basename(header))

searchfiles = []
for root, dirs, files in os.walk(os.getcwd()):
    for sfile in files:
        if not sfile.endswith(('.hpp', '.h')):
            continue
        searchfiles.append('%s/%s' % (root, sfile))

for sfile in searchfiles:
    if not os.path.exists(sfile):
        continue
    with open(sfile, 'rb') as f:
        content = f.read()
    match = re.findall('#ifndef (.*_[h|H])\n#define .*_[h|H].*\n', content)
    if match:
        normalized = match[0].lstrip('__').replace('__h', '_h').upper()
        if normalized == match[0]:
            continue
        print('correcting guard in %s' %  sfile)
        with open(sfile, 'wb') as f:
            f.write(content.replace(match[0], normalized))
    elif os.path.basename(sfile) in kheaders:
        print('no include guard in %s' % sfile)