FROM mlarq/melibuntujdk:latest

RUN mkdir /apps

RUN wget "http://mirrors.nxnethosting.com/apache/tomcat/tomcat-8/v8.0.21/bin/apache-tomcat-8.0.21.tar.gz" -O /tmp/apache-tomcat.tar.gz && \
  cd /apps && \
  tar zxf /tmp/apache-tomcat.tar.gz && \
  rm /tmp/apache-tomcat.tar.gz && \
  mv /apps/apache-tomcat* /apps/tomcat && \
  rm -fr /apps/tomcat/webapps/ROOT

RUN apt-get update -y && apt-get install -y --no-install-recommends libtcnative-1

RUN wget "https://s3.amazonaws.com/newrelic-jars/newrelic-java-3.15.0.zip" -O /tmp/newrelic-java-3.15.0.zip && \
  cd /apps && \
  unzip /tmp/newrelic-java-3.15.0.zip -d /apps && \
  rm /tmp/newrelic-java-3.15.0.zip

ENV CATALINA_HOME /apps/tomcat

ENV JAVA_OPTS "$JAVA_OPTS -javaagent:/apps/newrelic/newrelic.jar -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=7199 -Dcom.sun.management.jmxremote.local.only=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

EXPOSE 8080

ONBUILD ADD ./ $CATALINA_HOME/webapps/

ONBUILD CMD $CATALINA_HOME/bin/catalina.sh run

CMD ["/bin/bash"]
