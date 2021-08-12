#!/bin/sh
# Simple script to build containers and upload to registry

# Login to docker hub
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD

docker buildx create --use

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