docker build -t test -f Dockerfile .
docker run -t -d -p 8080:80 test
open http://127.0.0.1:8080
