#!/bin/bash

echo $'\nAvailable options for ROS2 OptiTrack docker image: \n'
PS3='Please choose what : '
options=("Build" "Run" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Build")
            echo $'\nBuilding OptiTrack docker image...\n'
            sudo docker pull osrf/ros:humble-desktop
            sudo docker build -f optitrack_dockerfile -t opti:0.1 .
            break
            ;;
        "Run")
            echo $'\nRunning OptiTrack docker image...\n'
            sudo docker run -itd --hostname optitrack-docker --add-host="optitrack-docker:127.0.1.1" --add-host="DingoRobot:10.42.0.1" --add-host="l4t-ubuntu:10.42.0.157"  --privileged --rm --net=host --name=Optitrack --runtime nvidia --gpus all -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix opti:0.1 bin/bash && sudo docker exec -it Optitrack sudo route add -net 10.42.0.0 netmask 255.255.255.0 gw 192.168.0.105 && route -n
            docker attach Optitrack
             break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
