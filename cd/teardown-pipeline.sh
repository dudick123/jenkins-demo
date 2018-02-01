echo "Executing Teardown Pipeline"
docker container stop $CONTAINER_NAME-$BUILD_NUMBER
docker image rmi $IMAGE_TAG:$BUILD_NUMBER
docker build --tag $REPOSITORY_NAME/$IMAGE_TAG:latest
