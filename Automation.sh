#!/bin/bash

filename1=$(basename $1)

read -p "Do you want to configure the genetic.config file ? [Y/n]" genetic
    if [ $genetic == Y ];then
        sudo vi genetic.config;
    fi
        
read -p "Which arch do you want? [x86/x64]" arch
    if [ $arch == x64 ]; then
        sudo ./ebowla.py $1 genetic.config;
        sudo ./build_x64_go.sh output/go_symmetric_$filename1.go $2;
        exit 1;
    elif [ $arch == x86 ];then
        sudo ./ebowla.py $1 genetic.config;
        sudo ./build_x86_go.sh output/go_symmetric_$filename1.go $2;
        exit 1;
    else
        echo "You need to choose an arch!!"
        exit 0;
    fi

