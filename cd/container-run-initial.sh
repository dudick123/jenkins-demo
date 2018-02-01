echo "Executing Container Run Initial"
sh 'docker container run -d --rm -p 80:80 --name $CONTAINER_NAME-$BUILD_NUMBER $IMAGE_TAG:$BUILD_NUMBER'