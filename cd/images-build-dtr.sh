echo "Executing Images Build DTR"
docker build --tag $REPOSITORY_NAME/$IMAGE_TAG:latest .
docker image inspect $REPOSITORY_NAME/$IMAGE_TAG:latest