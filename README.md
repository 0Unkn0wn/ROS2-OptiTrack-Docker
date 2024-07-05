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
docker pull ghcr.io/0unkn0wn/ros2-optitrack-docker:latest
```

And run it with:
```
docker run -it --rm --hostname optitrack-docker --privileged --net=host --name=Optitrack -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ghcr.io/0unkn0wn/ros2-optitrack-docker:latest bin/bash 
```

Right now there are some [issues](https://github.com/ros2/ros2cli/issues/903) when running the container on Arch-based or Fedora-based systems or anything that's not Debian-based.

[The fix](https://github.com/ros2/ros2cli/issues/903#issuecomment-2146858338) is either appending this to the run command: `--ulimit nofile=1024:1048576` :

```
docker run -it --rm --hostname optitrack-docker --privileged --net=host --name=Optitrack --ulimit nofile=1024:1048576 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ghcr.io/0unkn0wn/ros2-optitrack-docker:latest bin/bash 
```

Or running each ros2 cli command with `--no-daemon` at the [end](https://github.com/ros2/ros2cli/issues/903#issuecomment-2091140671).

First, make sure that X11 settings are properly set:

https://unix.stackexchange.com/a/317083.

https://medium.com/geekculture/run-a-gui-software-inside-a-docker-container-dce61771f9
