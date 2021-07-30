#!/bin/bash
email=$1
if [ $# -gt 0 ];then
	echo "adding a key to system in preparation of sharing with github"
	echo "generating new ed25519 key using provided argument "$email" as a label"
	ssh-keygen -t ed25519 -C $email
	echo "start the ssh-agent in the background"
	eval "$(ssh-agent -s)"
	echo "adding ssh key to the ssh-agent, using the default name id_ed25519"
	ssh-add ~/.ssh/id_ed25519
	echo "displaying ssh key which will be shared with github"
	cat ./.ssh/id_ed25519.pub
else
	echo "give me an email dummy"
	echo "doing nothing"
fi
