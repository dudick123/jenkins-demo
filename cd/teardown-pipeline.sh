echo "Executing Teardown Pipeline"
docker container ls
docker container stop $CONTAINER_NAME-$BUILD_NUMBER -f
sleep 1
docker container ls
docker image ls
docker image rmi $IMAGE_TAG:$BUILD_NUMBER
sleep 1
docker image ls
docker image rmi bdudick/test-web-app-rc1.2.3:latest
sleep 1
docker image ls
