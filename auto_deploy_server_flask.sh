#!bin/bash

printf "Cheking dependecies...\n"
platform='unknown'
command_install='unknown'

# Verify sistem adn unpdate packages
if [ -f /etc/arch-release ] ; then 
    platform="Arch-linux"
    command_install="pacman"
    sudo "${command_install}" -Sy
elif [ -f /etc/redhat-release ] ; then 
    platform="Red Hat"
    command_install="yum"
    sudo "${command_install}" update
elif [ -f /etc/fedora-release ] ; then
    platform="Fedora"
    command_install="dnf"
    sudo "${command_install}" update
elif [ -f /etc/debian_release ] ; then
    platform="Debian"
    command_install="apt-get"
    sudo "${command_install}" update
fi 

echo "Platform => " "${platform}"

dependecies_bash=("python3" "pip") 
packages_python=("virtualenv" "Flask" "unicorn")

for i in "${dependecies_bash[@]}"
    do 
        if ! command -v "${i}" &> /dev/null ; then
            printf "Not found to => "
            if [ "${command_install}" == "pacman" ] ; then
                sudo "${command_install}" -S "${i}" 
            else 
                sudo "${command_install}" install "${i}"
            fi

        else
             "${i}" --version
        fi
    done 
