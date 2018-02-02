echo "Executing Images Push DTR"
docker login --username=bdudick --password=lucy1398
docker push $REPOSITORY_NAME/$IMAGE_TAG:latest