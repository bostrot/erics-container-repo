#!/bin/sh
# Simple script to build containers and upload to registry

# Login to docker hub
# docker login --password-stdin -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD

#docker context create ctx
#docker buildx create --use

docker login --username $CI_REGISTRY_USER --password-stdin $CI_REGISTRY_PASSWORD
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --name multiarch --driver docker-container --use
docker buildx inspect --bootstrap

# Build and push docker containers
for folder in $(ls -d */);
do
    folder_name=${folder%/};
    # Skip scripts folder
    if [ $folder_name = 'scripts' ]
    then
        continue
    fi
    echo "Building and pushing $folder_name";
    # echo `docker build -t bostrot/$folder_name:latest $folder`;
    # echo `docker push bostrot/$folder_name:latest`;
    echo `docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag bostrot/$folder_name:latest $folder`
done;
