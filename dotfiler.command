#!
cp ~/dotfiler.command ~/dotfiles-maniac
cp ~/.vimrc ~/dotfiles-maniac
cp ~/.tmux.conf ~/dotfiles-maniac
cp ~/.bash_profile ~/dotfiles-maniac
echo "copied..."
cd ~/dotfiles-maniac
git add -A .
git commit -m "autocommit"
git push origin master
echo "autocomitted..."
cd -
echo "we back..."
