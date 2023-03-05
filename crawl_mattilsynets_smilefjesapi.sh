#!/bin/bash  

pageNumber=1;

while [ $pageNumber -le 432 ] 
do 
    sleep 1;
    echo "Starting to fetch page: $pageNumber"
    curl --silent "https://hotell.difi.no/api/json/mattilsynet/smilefjes/tilsyn?page=$pageNumber"  > mattilsynets_smilefjes_"$pageNumber".json 
    echo "Finished fetching page $pageNumber"
    ((pageNumber++))
done
