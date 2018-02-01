echo "Executing Teardown Pipeline"
sh 'docker container stop $CONTAINER_NAME-$BUILD_NUMBER'
sh 'docker image rmi $IMAGE_TAG:$BUILD_NUMBER'