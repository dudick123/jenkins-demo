echo "Executing Prepare Pipeline"
echo 'Make sure the Docker Environment is ready for the build steps.'
echo 'Remove Containers which may cause name or port conflicts.'
echo 'Remove Images which may cause tag conflicts.'
if [[ "$(docker images -q $REPOSITORY_NAME/$IMAGE_TAG:latest 2> /dev/null)" == "" ]]; then
  docker image ls
  docker image rmi $REPOSITORY_NAME/$IMAGE_TAG:latest
  echo "Local Repository Image Found. Removing It."
fi
