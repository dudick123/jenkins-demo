echo "Executing Images Push DTR"

docker login -u=$DTR_CREDS_USR -p=$DTR_CREDS_PSW

docker push $REPOSITORY_NAME/$IMAGE_TAG:latest