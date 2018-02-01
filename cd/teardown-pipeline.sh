echo "Executing Teardown Pipeline"
docker container stop $CONTAINER_NAME-$BUILD_NUMBER -f
docker image rmi $IMAGE_TAG:$BUILD_NUMBER
docker image rmi bdudick/test-web-app-rc1.2.3:latest
