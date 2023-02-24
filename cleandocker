#!/bin/bash 
# 
# Script for cleaning up your harddisk when it becomes low on storage.
# Stops and removes all containers and images
# They are usually possible to download later anyways.
# Easily removes some Gigabytes from your harddisk!
#

for x in `docker ps | awk '{ print $1 }' | grep -v CONTAINER`; do docker stop $x; done
for x in `docker container ps -a | awk '{ print $1 }' | grep -v CONTAINER`; do docker rm $x; done
for x in `docker images -a | awk '{ print $3 }' | grep -v IMAGE`; do docker rmi $x --force; done
docker volume prune; # removes docker volumes not attached to container   

read -r -p "Do you want to delete active docker volumes? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then

    docker volume rm $(docker volume ls -q) 
    docker volume ls --quiet | xargs -I {} docker volume rm {}

fi
