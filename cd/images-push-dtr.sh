echo "Executing Images Push DTR"
docker login --username=docker-bdudick-credentials_USR --password=docker-bdudick-credentials_PSW
docker push $REPOSITORY_NAME/$IMAGE_TAG:latest