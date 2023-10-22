#!/bin/bash

export JAVA_HOME=$(dirname $(dirname `readlink -f /etc/alternatives/java`))

OIFS=$IFS
IFS=':';
for i in $PATH;
do
        JAVA1=$i/bin/java
        JAVA2=$i/java
        if [ -d "$i" ];
        then
                if [ ! -L "$JAVA1" ] && [ -x "$JAVA1" ] || [ ! -L "$JAVA2" ] && [ -x "$JAVA2" ];
                then
                        echo "dropping path: $i";
                else
                        NEW=$NEW:$i
                fi
        fi
done
IFS=$OIFS
PATH=$NEW:$JAVA_HOME/bin
PATH=${PATH#:*}
echo 
echo "Final:"
echo $PATH

