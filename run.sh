#!/bin/bssh
# use cassandra backed db instead of berkeleyje
sed -i "s/host: localhost/host: 127.0.0.1/g" /opt/titan-1.0.0-hadoop1/conf/gremlin-server/gremlin-server.yaml
sed -i "s/titan-berkeleyje-server.properties/titan-cassandra-server.properties/g" /opt/titan-1.0.0-hadoop1/conf/gremlin-server/gremlin-server.yaml
sed -i "s/channelizer: org.apache.tinkerpop.gremlin.server.channel.WebSocketChannelizer/channelizer: org.apache.tinkerpop.gremlin.server.channel.HttpChannelizer/g" /opt/titan-1.0.0-hadoop1/conf/gremlin-server/gremlin-server.yaml

# create the backing file
echo "gremlin.graph=com.thinkaurelius.titan.core.TitanFactory
storage.backend=cassandra
storage.hostname=127.0.0.1
index.search.backend=elasticsearch
index.search.elasticsearch.interface=NODE
" > conf/gremlin-server/titan-cassandra-server.properties

#sed -i "s/ELASTICSEARCH_IP:=127.0.0.1/ELASTICSEARCH_IP:=0.0.0.0/g" /opt/titan-1.0.0-hadoop1/bin/titan.sh
#sed -i "s/GSRV_IP:=127.0.0.1/GSRV_IP:=0.0.0.0/g" /opt/titan-1.0.0-hadoop1/bin/titan.sh
/opt/titan-1.0.0-hadoop1/bin/titan.sh start 
