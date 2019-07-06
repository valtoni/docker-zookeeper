# Apache Zookeeper 3.5.5 - Docker Container

![alt text](https://github.com/valtoni/docker-zookeeper/raw/master/images/zookeeper_logo.jpg "Zookeeper Logo")

## Acknowledgements

I know. Zookeeper has an official docker image at https://hub.docker.com/_/zookeeper. Why do you do that?
Knowledgement. This is the full source of power, and the directories have been organized to be binded to your
filesystems. I touched the log configuration to trace mode. Logs and data can be binded to separated directories.

These was created to serve single instance of zookeeper, to serve development.

## Container Directories

1. WORKDIR: /work/services/zookeeper
2. Dir logs: /work/services/zookeeper/logs
3. Zookeeper data: /work/services/zookeeper/data
4. Zookeeper confs: /work/services/zookeeper/zookeeper-3.5.5-bin/conf

## Build command

Checkout git repository. Inside them type:

```bash
docker build -t zookeeper-single  .
```

## Sample Run

You can run two binded directories and expose 2181 default port to localhost like this:

```bash
docker run -v /work/workspaces/docker/zookeeper-single/work/logs:/work/services/zookeeper/logs -v /work/workspaces/docker/zookeeper-single/work/data:/work/services/zookeeper/data -p 2181:2181 -t zookeeper-single
```