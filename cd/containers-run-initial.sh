echo "Executing Container Run Initial"
docker container run -d --rm -p 8181:80 --name $CONTAINER_NAME-$BUILD_NUMBER $IMAGE_TAG:$BUILD_NUMBER
