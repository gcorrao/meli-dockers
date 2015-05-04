FROM datadog/docker-dd-agent

RUN sed -i -e "s/programs=forwarder,collector,dogstatsd,jmxfetch/programs=forwarder,collector,dogstatsd/" /etc/dd-agent/supervisor.conf
