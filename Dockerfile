FROM java:latest

LABEL Description="Titan Graph DB with Gremlin to be used with Cassandra and Elasticsearch" Version="1.0" Tags="cassandra,elasticsearch,graph,gremlin,titan"

WORKDIR /opt/titan-1.0.0-hadoop1

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

ADD run.sh /opt/titan-1.0.0-hadoop1/
ADD wrapper.sh /opt/titan-1.0.0-hadoop1/
EXPOSE 8182

RUN sh run.sh

ENTRYPOINT ["/opt/titan-1.0.0-hadoop1/wrapper.sh"]
