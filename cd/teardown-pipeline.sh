echo "Executing Teardown Pipeline"
docker container ls
docker container stop $CONTAINER_NAME-$BUILD_NUMBER -f
docker container ls
docker image ls
docker image rmi $IMAGE_TAG:$BUILD_NUMBER
docker image ls
docker image rmi bdudick/test-web-app-rc1.2.3:latest
docker image ls
