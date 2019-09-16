#!/bin/bash


# Get Spark Master IP
echo export SPARK_MASTER_IP=`hostname -i` > $HOME/.bashrc
source $HOME/.bashrc

#Start Spark Master from parent container
/bin/bash /master.sh &

#Adjust livy confs
sed -i "/\# livy.spark.master =/c\livy.spark.master = spark:\/\/$(hostname -i):$(echo $SPARK_MASTER_PORT)" ${LIVY_HOME}/conf/livy.conf 
sed -i "/\# livy.spark.deploy-mode =/c\livy.spark.deploy-mode = client" ${LIVY_HOME}/conf/livy.conf 

#Start livy
/bin/bash ${LIVY_HOME}/bin/livy-server start & tail -f /dev/null #stay live as live-server exits
 

