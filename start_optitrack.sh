#!/bin/bash

echo $'\nStarting Optitrack\n'

. ~/opti_ws/install/setup.bash

ros2 launch mocap_optitrack mocap.launch.py
