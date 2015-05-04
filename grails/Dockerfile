#Base image for building grails application
FROM mlarq/melibuntujdk:latest

#Install grails
RUN mkdir /apps
RUN wget "https://github.com/grails/grails-core/releases/download/v2.4.5/grails-2.4.5.zip" -O /tmp/grails.zip && unzip /tmp/grails.zip -d /apps && mv /apps/grails-* /apps/grails
ENV GRAILS_HOME /apps/grails
ENV PATH $PATH:$GRAILS_HOME/bin

##Install grails basic dependencies
WORKDIR /
RUN grails create-app dummy_app && cd dummy_app && grails refresh-dependencies --non-interactive

RUN mkdir /commands
COPY ./ /commands
RUN chmod -R 777 /commands

ONBUILD RUN mkdir -p /output

ONBUILD COPY ./grails-app/conf/BuildConfig.groovy /dummy_app/grails-app/conf/BuildConfig.groovy
ONBUILD WORKDIR /dummy_app
ONBUILD RUN grails refresh-dependencies --non-interactive

ONBUILD COPY ./ /app
ONBUILD WORKDIR /app
ONBUILD CMD grails test --non-interactive && grails war --non-interactive /output/ROOT.war

CMD ["/bin/bash"]
