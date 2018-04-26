#!/bin/bash

commit(){
	commitMessageDefault="Commit Rapido"
	read -p "Ingrese Mensaje: [$commitMessageDefault]: " commitMessage
	commitMessage=${commitMessage:-$commitMessageDefault}
	sudo chmod 777 -R ./
	git update-index --refresh
	git rm -r --cached .
	git config core.fileMode false
	git config --add --global core.filemode false
	git add --all
	git commit -a -m "$commitMessage"
	#git push
}
default="default"
parameter=${1:-$default}
if [ $parameter = install ]; then
	echo "alias fastcommit=\"sh ~/.fastcommit.sh\"" >> ~/.bashrc
	source ~/.bashrc
	cp ./.fastcommit.sh ~/
else
	commit
fi