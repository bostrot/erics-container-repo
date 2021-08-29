#!/bin/sh
# Simple script to build containers and upload to registry

# Login to docker hub
docker login --username $CI_REGISTRY_USER --password $CI_REGISTRY_PASSWORD

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
    echo `docker buildx build --push --platform linux/amd64,linux/arm/v7,linux/arm64,linux/ppc64le,linux/s390x --tag bostrot/$folder_name:latest $folder`
done;
