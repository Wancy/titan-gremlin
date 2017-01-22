#!/bin/bssh
BIN=./bin
# use cassandra backed db instead of berkeleyje
# sed -i "s/host: localhost/host: 0.0.0.0/g" conf/gremlin-server/gremlin-server.yaml
sed -i '' "s/titan-berkeleyje-server.properties/titan-cassandra-server.properties/g" conf/gremlin-server/gremlin-server.yaml
sed -i '' "s/channelizer: org.apache.tinkerpop.gremlin.server.channel.WebSocketChannelizer/channelizer: org.apache.tinkerpop.gremlin.server.channel.HttpChannelizer/g" conf/gremlin-server/gremlin-server.yaml

# create the backing file
echo "index.search.backend=elasticsearch
index.search.hostname=100.100.101.1, 100.100.101.2
index.search.elasticsearch.client-only=true
storage.backend=cassandra
storage.hostname=localhost" > conf/gremlin-server/titan-cassandra-server.properties

$BIN/titan.sh start 
