#!/bin/bash
script_dir=$(cd $(dirname $0);pwd)
docker run --rm -it \
		--name ego_ros1 \
		--privileged \
		--network host \
		-e DISPLAY=$DISPLAY \
		-v /tmp/.X11-unix/:/tmp/.X11-unix \
		-v $script_dir/../../../../../:/root/ros1_ws/ \
        jasonxxxyyy/sky-explorer:runtime-cuda11.4-ros1-amd64 \
		/root/ros1_ws/src/ego-planner-swarm/scripts/demo.py --run