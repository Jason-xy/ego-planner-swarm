#!/bin/bash
script_dir=$(cd $(dirname $0);pwd)
sudo docker run --rm \
    -v $script_dir/../../:/root/ros1_ws/ \
    jasonxxxyyy/sky-explorer:runtime-cuda11.4-ros1-$1 \
    /bin/bash -c "cd /root/ros1_ws && \
            source /opt/ros/noetic/setup.bash && \
            catkin_make"