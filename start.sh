#!/bin/sh

 
read -r -p "Wanna setup a gpg key? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo "Did you backup your private key, if not gpg-backup and store the .asc somewhere safe."
 echo "Yes, then download your backed up private key."
 echo "run gpg --import /path/to/private/key.asc"
 echo "take note of your pub key after you import"
 echo "gpg --list-keys"
 echo "run pass init VALUEOFYOURPUBLICKEY"
 echo "make sure your key is trusted"
 echo "gpg --edit-key VALUEOFYOURPUBLICKEY... trust, 5, save"
 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
 
read -r -p "Wanna setup git? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
	echo "Yes"
	echo -e "Configuring git variables... \n"
	echo "what is your gitname"
	read GITNAME
	echo "email is..."
	read EMAIL
	git config --global color.ui auto
	git config --global user.name $GITNAME
	git config --global user.email $EMAIL
	echo "herez yer stuff..."
	git config --list



 ;;
    [nN][oO]|[nN])
 echo "No"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac



read -n 1 -s -r -p "press any key to link tmux and emacs dotfiles"
ln -sv ~/dotfiles-maniac/.emacs ~/
ln -sv ~/dotfiles-maniac/.tmux.conf ~/

