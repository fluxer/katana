#!/usr/bin/python

# a script to migrate from automoc4 to CMake automoc

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
        sfull = os.path.join(sroot, sfile)
        if sfile.endswith(('.h', '.hh', '.hpp', '.c', '.cc', '.cpp')):
            lmatch = re.findall('(\n#include (?:"|<)(.*/)?(.*).moc(?:"|>))', fread(sfull))
            if lmatch and not re.findall('Q_OBJECT', fread(sfull)):
                print('Adjusting moc inclusion of', sfull)
                for match in lmatch:
                    fwrite(sfull, fread(sfull).replace(match[0], \
                        '\n#include "%smoc_%s.cpp"' % (match[1], match[2])))

        elif sfile.endswith('CMakeLists.txt'):
            lmatch = re.findall('(automoc4_add_library)', fread(sfull))
            if lmatch:
                print('Adjusting automoc4_add_library of', sfull)
                fwrite(sfull, fread(sfull).replace('\nautomoc4_add_library', '\nadd_library'))

        # TODO: cmake_minimum_required, 2.8.6