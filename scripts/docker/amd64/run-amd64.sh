#!/bin/bash
script_dir=$(cd $(dirname $0);pwd)
docker run --gpus all -it \
		--name ego_ros1 \
		--privileged \
		--network host \
		-e DISPLAY=$DISPLAY \
		-v /tmp/.X11-unix/:/tmp/.X11-unix \
		-v $script_dir/../../../src/:/root/ros1_ws/src/ \
        jasonxxxyyy/sky-explorer:runtime-cuda11.4-ros1-amd64