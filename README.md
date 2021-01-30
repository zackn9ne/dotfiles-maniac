dotfiles-maniac zackn9ne's dotfiles
# how this works

```
cd ~/
git clone git@github.com:zackn9ne/dotfiles-maniac.git
ln -sv ~/dotfiles-maniac/.emacs ~/
ln -sv ~/dotfiles-maniac/.tmux.conf ~/
```

# you can use GNU Stow
```
cd ~/dotfiles-maniac && stow tmux emacs
```
