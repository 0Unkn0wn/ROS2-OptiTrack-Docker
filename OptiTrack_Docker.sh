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
	    sudo docker build -f optitrack_dockerfile -t ros2/optitrack:0.1 .
	    break
	    ;;
        "Run")
            echo $'\nRunning OptiTrack docker image...\n'
	    sudo docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ros2/optitrack:0.1 bin/bash
            break
	    ;;
	"Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
