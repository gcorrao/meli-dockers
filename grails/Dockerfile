#Base image for building grails application
FROM mlarq/melibuntujdk:latest

RUN apt-get --yes --force-yes install unzip \
    && curl --silent --location --show-error --verbose "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.4.4.zip" >/tmp/grails.zip \
    && unzip /tmp/grails.zip -d /apps
ENV GRAILS_HOME /apps/grails
ENV PATH $PATH:$GRAILS_HOME/bin

WORKDIR /
RUN grails create-app app && cd app && grails refresh-dependencies

ONBUILD RUN mkdir -p /output
ONBUILD CMD grails refresh-dependencies && grails war --non-interactive /output/ROOT.war

CMD ["/bin/bash"]
