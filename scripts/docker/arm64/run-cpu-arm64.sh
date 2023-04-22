#!/bin/bash
script_dir=$(cd $(dirname $0);pwd)
sudo docker run --rm -it \
		--name vins \
		--privileged \
		--network host \
		-e DISPLAY=$DISPLAY \
		-v /dev:/dev \
		-v /tmp/.X11-unix/:/tmp/.X11-unix \
		-v /tmp/argus_socket:/tmp/argus_socket \
		-v /etc/enctune.conf:/etc/enctune.conf \
		-v $script_dir/../../../../../:/root/ros1_ws/ \
        jasonxxxyyy/sky-explorer:runtime-cuda11.4-ros1-arm64 \
		/root/ros1_ws/src/ego-planner-swarm/scripts/demo.py --run