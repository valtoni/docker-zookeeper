WORKDIR: /work/services/zookeeper
Dir logs: /work/services/zookeeper/logs
Zookeeper data: /work/services/zookeeper/data
Zookeeper confs: /work/services/zookeeper/zookeeper-3.5.5-bin/conf

docker run -v /work/workspaces/docker/zookeeper-single/work/logs:/work/services/zookeeper/logs -v /work/workspaces/docker/zookeeper-single/work/data:/work/services/zookeeper/data -p 2181:2181 -t zookeeper-single

