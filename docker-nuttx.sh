#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ACTION=$1
ACTION=${ACTION:="build"}
shift

FOLDER=${PWD##*/}
FOLDER=${FOLDER:-/}        # to correct for the case where PWD=/

IMAGE=$2
IMAGE=${IMAGE:="ghcr.io/bcadet/docker-nuttx:master"}
shift

function build_image() {
    docker buildx build \
        -t $IMAGE \
        .
}

function run_image() {
    docker run -it --rm \
        -v `pwd`:/workspaces/$FOLDER \
        --workdir=/workspaces/$FOLDER \
        --env REMOTE_USER="builder" \
        --env NEW_UID=$(id -u) \
        --env NEW_GID=$(id -g) \
        $IMAGE
}

case $ACTION in
    "build")
        build_image $@
        ;;
    "run")
        run_image $@
        ;;
    *)
        echo "Action $ACTION not available"
        ;;
esac