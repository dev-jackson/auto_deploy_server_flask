#!bin/bash

printf "Cheking dependecies...\n"

dependecies=("python3" "pip")

for i in "${dependecies[@]}"
do 
    echo "Type ${i}"
done 