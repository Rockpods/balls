#!/bin/bash

# Check if PKGBUILD folder exists, if not create it
if [ ! -d ~/balls/men ]; then
  echo "Creating directory for storing PKGBUILD."
  mkdir -p ~/balls/men
fi

echo "https://aur.archlinux.org/${1}.git"
# git clone https://aur.archlinux.org/${1}.git

# Check if new install or update
cd ~/balls/men
# pwd
# echo "~/balls/men/${1}"
if [ -d "~/balls/men/${1}" ]; then
  echo "Repo has not been cloned in the past. Cloning"
  git clone https://aur.archlinux.org/${1}.git
else
  echo "Repo has been cloned in the past. Updating"
  cd ${1}
  git pull https://aur.archlinux.org/${1}.git
  cd ../
fi

cd ${1}
# pwd
makepkg -si
