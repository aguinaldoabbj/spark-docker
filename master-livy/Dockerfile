FROM bde2020/spark-master

ENV LIVY_VERSION 0.6.0-incubating

ENV LIVY_PORT 8998

ENV PYTHON_VERSION 3.7

ENV LIVY_URL https://archive.apache.org/dist/incubator/livy/${LIVY_VERSION}/apache-livy-${LIVY_VERSION}-bin.zip

ENV LIVY_HOME /livy

ENV SPARK_HOME /spark

ENV SPARK_DRIVER_PORT 7076
ENV SPARK_BLOCKMGR_PORT 7079

COPY start-livy.sh /

# Alpine Linux comes with Python 2.7 by default
RUN ln -sf /usr/bin/python${PYTHON_VERSION} /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip

RUN apk update && apk add \
    unzip \
    wget \
    && rm -rf /var/cache/apk/*
        
RUN   wget -c $LIVY_URL -O /tmp/livy-bin.zip \
      && unzip /tmp/livy-bin.zip -d /tmp/ \
      && mv /tmp/apache-livy-${LIVY_VERSION}-bin ${LIVY_HOME} \
      && rm /tmp/livy-bin.zip \
      && cp ${LIVY_HOME}/conf/livy.conf.template ${LIVY_HOME}/conf/livy.conf \ 
      && cp ${LIVY_HOME}/conf/log4j.properties.template ${LIVY_HOME}/conf/log4j.properties 
        
EXPOSE ${LIVY_PORT} ${SPARK_DRIVER_PORT} ${SPARK_BLOCKMGR_PORT}

CMD bash /start-livy.sh

HEALTHCHECK CMD curl -f http://localhost:8998/ || exit 1

