FROM java:latest

LABEL Description="Titan Graph DB with Gremlin to be used with Cassandra and Elasticsearch" Version="1.0" Tags="cassandra,elasticsearch,graph,gremlin,titan"

WORKDIR /titan-1.0.0-hadoop1

RUN wget http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip

RUN unzip /titan-1.0.0-hadoop1.zip && \
    rm /titan-1.0.0-hadoop1.zip

ADD run.sh /titan-1.0.0-hadoop1/

EXPOSE 8182

RUN cd /titan-1.0.0-hadoop1
RUN bash run.sh
