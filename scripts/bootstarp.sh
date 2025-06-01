#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying dotfiles..."
cp ~/devbox/.bashrc ~/.bashrc
cp ~/devbox/.bash_aliases ~/.bash_aliases
cp ~/devbox/.vimrc ~/.vimrc

echo "Reloading bashrc..."
source ~/.bashrc

echo "Done! Your dev environment is set up."

cd
rm -rf ~/devbox
echo "Cleaning up..."
echo "You can now start using your dev environment with the new configurations."
