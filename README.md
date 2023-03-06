# Docker Oracle Client Sample

### Development

Requirements: Docker 

Simply run 

`docker build --no-cache --build-arg GIT_HEAD=$(git rev-parse --short HEAD) -t dockerize-oracle-client . && 
docker run -it --name=dockerize-oracle-client --rm -p 8080:8080 dockerize-oracle-client`




