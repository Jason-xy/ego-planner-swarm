#!/bin/bash
script_dir=$(cd $(dirname $0);pwd)
docker run --rm \
    -v $script_dir/../../src:/root/ros1_ws/src \
    jasonxxxyyy/sky-explorer:runtime-cuda11.4-ros1-$1 \
    /bin/bash -c "cd /root/ros1_ws && \
            source /opt/ros/noetic/setup.bash && \
            catkin_make"