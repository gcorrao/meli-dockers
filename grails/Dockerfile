#Base image for building grails application
FROM mlarq/melibuntujdk:latest

#Install grails
RUN apt-get --yes --force-yes install unzip && curl --silent --location --show-error --verbose "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.4.3.zip" >/tmp/grails.zip && unzip /tmp/grails.zip -d /apps && mv /apps/grails-2.4.3/ /apps/grails
ENV GRAILS_HOME /apps/grails
ENV PATH $PATH:$GRAILS_HOME/bin

##Install grails basic dependencies
WORKDIR /
RUN grails create-app --non-interactive app && cd app && grails refresh-dependencies --non-interactive
ONBUILD RUN mkdir -p /output
ONBUILD CMD grails refresh-dependencies --non-interactive && grails test --non-interactive && grails war --non-interactive /output/ROOT.war

CMD ["/bin/bash"]
