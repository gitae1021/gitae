cp .bashrc ~
cp -r .vim ~
cp .vimrc ~
cp .tmux.conf ~
cp .ctags ~
cp config ~/.ssh
cp install.sh ~
sudo cp -r colors/ /usr/share/vim/vim74
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "PluginInstall"
