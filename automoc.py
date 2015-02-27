#!/usr/bin/python

# a script to migrate from automoc4 to CMake automoc,
# you may have to run it more than once to get the good result

import os, re

directory = os.getcwd()

def fread(sfile):
    with open(sfile, 'rb') as f:
        content = f.read()
        f.close()
    return content

def fwrite(sfile, content):
    with open(sfile, 'wb') as f:
        f.write(content)
        f.close()

for sroot, ldirs, lfiles in os.walk(directory):
    for sfile in lfiles:
        if not sfile.endswith(('.h', '.hh', '.hpp', '.c', '.cc', '.cpp')):
            continue
        sfull = os.path.join(sroot, sfile)
        smatch = re.findall('(\n#include (?:"|<)(.*/)?(.*).moc(?:"|>))', fread(sfull))
        if smatch and not re.findall('Q_OBJECT', fread(sfull)):
            print('Adjusting moc inclusion of', sfull)
            fwrite(sfull, fread(sfull).replace(smatch[0][0], \
                '\n#include "%smoc_%s.cpp"' % (smatch[0][1], smatch[0][2])))

for sroot, ldirs, lfiles in os.walk(directory):
    if not sfile.endswith('CMakeLists.txt'):
        continue
    smatch = re.findall('(\nautomoc4_add_library')
    sfull = os.path.join(sroot, sfile)
    if smatch:
        print('Adjusting automoc4_add_library of', sfull)
        fwrite(sfull, fread(sfull).replace('\nautomoc4_add_library', '\nadd_library'))

# TODO: cmake_minimum_required