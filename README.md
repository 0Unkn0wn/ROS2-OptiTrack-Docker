# ROS2-OptiTrack-Docker
Dockerfile for running the ROS2 OptiTrack driver

This repository contains:
1. A Dockerfile with ROS2 and the [OptiTrack ROS2 driver](https://github.com/MOCAP4ROS2-Project/mocap4ros2_optitrack).
2. A script for building and running the container.
3. A script to start the driver once inside the container.
The base container is taken from [here](https://docs.ros.org/en/humble/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html).

(old way)
To build the repo locally: clone the repo and run the script and it will build it and from the same script you can run the resulting image automatically.

(new way)
Pull the image from the repo directly:
```
docker pull 
```

And run it with:
```
docker run 
```

First, make sure that X11 settings are properly set:

https://unix.stackexchange.com/a/317083.

https://medium.com/geekculture/run-a-gui-software-inside-a-docker-container-dce61771f9
