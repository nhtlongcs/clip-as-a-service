DOCKER_IMG=nhtlongcs/clip-embed:latest
docker run --rm --name clip --gpus device=0 --shm-size 16G -p 7777:7777 -it -v $(pwd)/:/home/nhtlong/workspace/ ${DOCKER_IMG} /bin/bash
# docker run --rm --name clip --gpus device=0 --shm-size 16G -it ${DOCKER_IMG} /bin/bash