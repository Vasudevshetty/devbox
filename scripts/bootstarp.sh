#!/bin/bash

echo "Cloning devbox repo..."
git clone https://github.com/vasudevshetty/devbox.git ~/devbox

echo "Copying dotfiles..."
cp ~/devbox/.bashrc ~/.bashrc
cp ~/devbox/.bash_aliases ~/.bash_aliases
cp ~/devbox/.vimrc ~/.vimrc

echo "Reloading bashrc..."
source ~/.bashrc

echo "Done! Your dev environment is set up."

rm -rf ~/devbox
echo "Cleaning up..."
echo "You can now start using your dev environment with the new configurations."
