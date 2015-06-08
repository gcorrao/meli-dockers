FROM ubuntu:latest

RUN apt-get install -y --no-install-recommends software-properties-common
RUN add-apt-repository ppa:adiscon/v8-stable -y
RUN echo "deb http://ppa.launchpad.net/adiscon/v8-stable/ubuntu trusty main" > /etc/apt/sources.list.d/adiscon-ubuntu-v8-stable-utopic.list
RUN apt-get update
RUN apt-get -y --no-install-recommends install rsyslog
RUN rm -fr /etc/rsyslog.d/*

COPY entrypoint.sh /entrypoint.sh

COPY rsyslog.conf /etc/
COPY rsyslog.d/* /etc/rsyslog.d/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rsyslogd", "-n"]
