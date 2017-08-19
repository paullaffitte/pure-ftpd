# pure-ftpd
A Pure-FTPd server with Docker

## Table of contents
- [Build](#build)
- [Run](#run)
- [Users management](#users-management)

## Build
In order to use the pure-ftpd container, you first need to build it. You can do it by tow way, the easy and the advanced one.

### Easy way
You just need to execute the build.sh script that would build the image under the name of "pure-ftpd".
```sh
./build.sh
```

### Advanced way
If you know a little bit about how Docker works, you can build the image by yourself.
To get help, you can read the content of the build.sh file, or even better, get help from Docker directly by typing the following command in your terminal.
```sh
docker build --help
```

## Run
There are also two ways to run your fresh buildt image in a container. See below.

### Easy way
Again, there is a script to run the container. You should not use this script if your image is hand-buildt, but if you do, please get sure that the name of your image match the name in this script.
```sh
./run.sh
```
By using this script, you will not be able to persist your data, so I highly suggest you to use your own run command, or even use docker-compose to link this container with a [LEMP stack](https://github.com/paullaffitte/lemp-stack) for exemple, and use a volume to share and persist your data between PHP and Pure-FTPd.

### Advanced way
As you can expect, I will advise you again to read the help provided by Docker, thanks to the following command.
```sh
docker run --help
```
Please be sure to map correctly the ports that you needs.

## Users management
The user management is here pretty simple, but also very basic in terms of features. Indeed, as you can see in the users file, at the root of the repository, you can define a list of user with password. Usernames and passwords are saparated by a ':' character. The first column coresspond to the username, and the second one tp his password. There is one user per line.
