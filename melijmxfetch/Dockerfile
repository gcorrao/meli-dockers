FROM datadog/docker-dd-agent

ADD conf.d/jmx.yaml /etc/dd-agent/conf.d/jmx.yaml
ADD conf.d/tomcat.yaml /etc/dd-agent/conf.d/tomcat.yaml

ENV JAVA_VERSION 1.8.0

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" \
      | tee /etc/apt/sources.list.d/webupd8team-java.list \
    &&  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" \
      | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
    && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" \
        | /usr/bin/debconf-set-selections \
    && apt-get update \
    && apt-get install -y \
        python-software-properties \
        oracle-java8-installer \
    && update-alternatives --display java \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN sed -i -e "s/^# statsd_forward_host:.*$/statsd_forward_host: datadog/" /etc/dd-agent/datadog.conf \
    && sed -i -e "s/^# statsd_forward_port:.*$/statsd_forward_port: 8125/" /etc/dd-agent/datadog.conf
COPY supervisor.conf /etc/dd-agent/supervisor.conf

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
