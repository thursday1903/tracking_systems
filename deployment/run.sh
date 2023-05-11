#!/bin/sh
SERVICE_NAME=web-cms-service
#LOG_DIR=/opt/logs/api-app-ship/app-api.log
PID_PATH_NAME=web-cms-pid
case $1 in
   start)
       echo "Starting $SERVICE_NAME ..."
       if [ ! -f $PID_PATH_NAME ]; then
           nohup java -Xmx512m -Dlog4j.configurationFile=resource/log4j2.properties -classpath "lib/*" com.imedia.ApiMain --spring.config.location=resource/application.properties > /dev/null 2>&1 &
           echo $! > $PID_PATH_NAME
           echo "$SERVICE_NAME started ..."
       else
           echo "$SERVICE_NAME is already running ..."
       fi
   ;;
   stop)
       if [ -f $PID_PATH_NAME ]; then
           PID=$(cat $PID_PATH_NAME);
           echo "$SERVICE_NAME stoping ..."
           kill $PID;
           echo "$SERVICE_NAME stopped ..."
           rm $PID_PATH_NAME
       else
           echo "$SERVICE_NAME is not running ..."
       fi
   ;;
   restart)
       if [ -f $PID_PATH_NAME ]; then
           PID=$(cat $PID_PATH_NAME);
           echo "$SERVICE_NAME stopping ...";
           kill $PID;
           echo "$SERVICE_NAME stopped ...";
           rm $PID_PATH_NAME
           echo "$SERVICE_NAME starting ..."
              nohup java -Xmx512m -Dlog4j.configurationFile=resource/log4j2.properties -classpath "lib/*" com.imedia.ApiMain --spring.config.location=resource/application.properties > /dev/null 2>&1 &
           echo $! > $PID_PATH_NAME
           echo "$SERVICE_NAME started ..."
       else
           echo "$SERVICE_NAME is not running ..."
       fi
   ;;
esac
