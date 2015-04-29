FROM mlarq/melibuntujdk:latest

RUN curl --silent --location --show-error --verbose "https://s3-us-west-2.amazonaws.com/dario-deploys2/apache-tomcat-7.0.57.tar.gz" | tar --extract --gzip --directory /apps
RUN curl --silent --location --show-error --verbose "https://s3-us-west-2.amazonaws.com/dario-deploys2/newrelic-java-3.12.0.zip" | tar --extract --gzip --directory /apps

ENV CATALINA_HOME /apps/apache-tomcat-7.0.57

ENV JAVA_OPTS "$JAVA_OPTS -javaagent:/apps/newrelic/newrelic.jar"

EXPOSE 8080

ONBUILD ADD ./ $CATALINA_HOME/webapps/

ONBUILD CMD $CATALINA_HOME/bin/catalina.sh run

CMD ["/bin/bash"]
