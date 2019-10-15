FROM bde2020/spark-worker

ENV PYTHON_VERSION 3

# Alpine Linux comes with Python 2.7 by default
RUN ln -sf /usr/bin/python${PYTHON_VERSION} /usr/bin/python \
    && ln -sf /usr/bin/pip${PYTHON_VERSION} /usr/bin/pip
    
COPY worker.sh /

ENV SPARK_WORKER_PORT 7078

ENV SPARK_DRIVER_PORT 7076

EXPOSE $SPARK_WORKER_PORT $SPARK_DRIVER_PORT
