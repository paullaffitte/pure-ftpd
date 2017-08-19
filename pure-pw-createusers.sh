#!/bin/sh

for user in $(cat users)
do
	username=$(echo $user | cut -d: -f1)
	password=$(echo $user | cut -d: -f2)
	echo "Adding new pure-ftp user '$username' with password '$password'"
	mkdir -p /home/ftpuser/repositories/$username
	(echo $password; echo $password) | pure-pw useradd $username -u ftpuser -g ftpgroup -d /home/ftpuser/repositories/$username
done

pure-pw mkdb
