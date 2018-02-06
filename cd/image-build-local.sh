echo "Executing Images Build Local"
cp ../dockerfiles/Dockerfile.local ../Dockerfile
cd ..
docker build --tag test-image:latest .
