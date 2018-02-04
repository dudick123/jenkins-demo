echo "Executing Container Run Local"
docker container run -d --rm -p 8181:80 --name test-container test-image:latest