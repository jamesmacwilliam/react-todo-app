docker build -t test -f docker/Dockerfile .
docker run -t -d -p 8080:80 test
