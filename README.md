# S2S

```shell
docker build -t <image_name>:<tag> .
git clone https://github.com/pnkq/code
docker run -d -v ${PWD}/code:/code --name s2s <image_name>:<tag>
docker exec -it s2s /bin/bash
```