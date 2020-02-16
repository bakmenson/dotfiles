import re
from subprocess import call

os_release = []

with open('/etc/os-release', 'r', encoding='UTF-8') as f:
    for i in f.readlines():
        os_release.append(i.rstrip('\n'))

distro_name = re.search(r"ID=(\w+)", ' '.join(os_release)).group(1)

file = distro_name + '-packages.txt'
packages_list = []

with open(file, 'r', encoding='UTF-8') as f:
    for i in f.readlines():
        packages_list.append(i.rstrip('\n'))

packages = ' '.join(packages_list)

if distro_name == 'ubuntu':
    call('sudo apt install ' + packages, shell=True)
elif distro_name == 'arch':
    call('sudo pacman -S ' + packages, shell=True)
else:
    pass
