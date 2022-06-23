# docker-nuttx
docker build environment for nuttx

## usage

- fill in the .env file the uid and gid of your user on the host (to avoid file access problems in the mounted folders)
    - USER_ID: your user id
    - GROUP_ID: your group id
    - BOARD_NAME: the board you want to build
    - CONFIG_NAME: the config you want to build
- clone the nuttx repo in this folder (`git clone https://github.com/apache/incubator-nuttx.git nuttx`)
- clone the apps repo in this folder (`git clone https://github.com/apache/incubator-nuttx-apps.git apps`)
- run `docker-compose build`
- run `docker-compose run docker-nuttx-bash`

## available services

- `docker-nuttx-bash`: enter in the container to dev
- `docker-nuttx-configure`: configure nuttx for the `BOARD_NAME` and `CONFIG_NAME` 
- `docker-nuttx-build`: build an already configured nuttx project