FROM java

LABEL Description="Titan Graph DB with Gremlin to be used with Cassandra and Elasticsearch" Version="1.0" Tags="cassandra,elasticsearch,graph,gremlin,titan"

ENV TITAN_VERSION 1.0.0

RUN wget -q -O /tmp/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-$TITAN_VERSION-hadoop2.zip
RUN unzip -q /tmp/titan.zip -d /opt && rm /tmp/titan.zip

ENV TITAN_HOME /opt/titan-$TITAN_VERSION-hadoop2
WORKDIR $TITAN_HOME

VOLUME ["/conf","/data"]
ADD start-gremlin.sh /opt/start-gremlin.sh

CMD ["/opt/start-gremlin.sh"]
