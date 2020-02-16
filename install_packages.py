from re import search
from subprocess import call


def get_data_from_file(file):
    list_of_words = []
    with open(file, 'r', encoding='UTF-8') as f:
        for word in f.readlines():
            list_of_words.append(word.rstrip('\n'))
    return list_of_words


os_release = get_data_from_file('/etc/os-release')
distro_name = search(r"ID=(\w+)", ' '.join(os_release)).group(1)

packages_file = distro_name + '-packages.txt'

packages_list = get_data_from_file(packages_file)
packages = ' '.join(packages_list)

if distro_name == 'ubuntu':
    call('sudo apt install ' + packages, shell=True)
elif distro_name == 'arch':
    call('sudo pacman -S ' + packages, shell=True)
else:
    pass
