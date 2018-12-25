#!/bin/bash
set -ex
# docker hub username
USERNAME=kimtholstorf
# VHA version (to be pulled from Dockerfile)
VHA=5.4.0
# image name
IMAGE=vha-collector
docker build -t $USERNAME/$IMAGE:5.4.0 $USERNAME/$IMAGE:latest .