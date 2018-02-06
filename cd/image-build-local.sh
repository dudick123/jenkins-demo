echo "Executing Build The Local Test Images"
docker build -f home/thedudicks/code/jenkins-demo/Dockerfile --tag test-image:latest .
