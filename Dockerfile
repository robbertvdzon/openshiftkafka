FROM openshift/redhat-openjdk18-openshift:latest

RUN curl https://www-eu.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz --output kafka.tgz \
    && gunzip kafka.tgz \
    && tar -xvf kafka.tar \
    && mv /home/jboss/kafka_2.11-2.1.0 /home/jboss/kafka \
    && sed -i 's/localhost:2181/rzozookeeper:2181/g' /home/jboss/kafka/config/server.properties

EXPOSE 9092

WORKDIR /home/jboss/kafka

ENTRYPOINT ["/home/jboss/kafka/bin/kafka-server-start.sh  /home/jboss/kafka/config/server.properties"]
