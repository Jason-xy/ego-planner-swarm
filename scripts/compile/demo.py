#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import subprocess as sbp
import argparse
import sys
import os

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')

def argparser(argv):
    parser = argparse.ArgumentParser(description='EGO-Planner Docker')
    parser.add_argument('--pack', action='store_true', help='pack ego-planner')
    parser.add_argument('--run', action='store_true', help='run ego-planner')
    parser.add_argument('--launch', type=str, default='swarm.launch', help='launch file')
    
    args = parser.parse_args(argv)
    return args

def compile_ego_planner():
    CMD = 'bash -c \"source /opt/ros/noetic/setup.bash && cd %s && catkin_make\"' % os.path.join(BASE_DIR, '..')
    os.system(CMD)

def pack_ego_planner():
    CMD = 'bash -c \"cd %s && tar -zcvhf src/devel.tar.gz devel && chmod 777 src/devel.tar.gz\"' % os.path.join(BASE_DIR, '..')
    os.system(CMD)

def launch_ego_planner(launch):
    CMD = 'bash -c \"source /opt/ros/noetic/setup.bash && source %s/../devel/setup.bash && roslaunch ego_planner %s\"' % (BASE_DIR, launch)
    os.system(CMD)

def main(argv):
    args = argparser(argv)
    compile_ego_planner()
    if args.pack:
        pack_ego_planner()
    elif args.run:
        launch_ego_planner(args.launch)

if __name__ == '__main__':
    main(sys.argv[1:])