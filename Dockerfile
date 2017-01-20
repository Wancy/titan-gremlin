FROM java

LABEL Description="Titan Graph DB with Gremlin to be used with Cassandra and Elasticsearch" Version="1.0" Tags="cassandra,elasticsearch,graph,gremlin,titan"

WORKDIR /titan/titan-1.0.0-hadoop1

RUN curl -o /titan/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip

RUN unzip /titan/titan.zip -d /titan/ && \
    rm /titan/titan.zip

ADD run.sh /titan/titan-1.0.0-hadoop1/

EXPOSE 8182
EXPOSE 8184

CMD ["/bin/sh", "-e", "/titan/titan-1.0.0-hadoop1/run.sh"]
