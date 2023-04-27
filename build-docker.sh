export DOCKER_BUILDKIT=1
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx create --use
docker buildx build -t=spring-project:latest --cache-from=type=local,src=./cache --cache-to=type=local,dest=./cache --load .
#docker buildx build -t=node-hello-app:latest --cache-from=type=local,src=./node_modules --cache-to=type=local,dest=./node_modules -f DockerfileWithCache --load .
