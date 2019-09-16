FROM bde2020/spark-master

ENV LIVY_VERSION 0.6.0-incubating

ENV LIVY_URL https://archive.apache.org/dist/incubator/livy/${LIVY_VERSION}/apache-livy-${LIVY_VERSION}-bin.zip

ENV LIVY_HOME /livy

ENV SPARK_HOME /spark

ENV SPARK_WORKER_PORT 3535 

COPY start-livy.sh /

RUN apk update && apk add \
    unzip \
    wget 
        
RUN   wget -c $LIVY_URL -O /tmp/livy-bin.zip \
      && unzip /tmp/livy-bin.zip -d /tmp/ \
      && mv /tmp/apache-livy-${LIVY_VERSION}-bin ${LIVY_HOME} \
      && rm /tmp/livy-bin.zip \
      && cp ${LIVY_HOME}/conf/livy.conf.template ${LIVY_HOME}/conf/livy.conf \ 
      && cp ${LIVY_HOME}/conf/log4j.properties.template ${LIVY_HOME}/conf/log4j.properties 
        
EXPOSE 8998

CMD bash /start-livy.sh

HEALTHCHECK CMD curl -f http://localhost:8998/ || exit 1

