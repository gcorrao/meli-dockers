# Base image for building grails application
FROM mlarq/grails:latest

ONBUILD RUN mkdir -p /output
ONBUILD COPY ./ /sources
ONBUILD WORKDIR /sources
ONBUILD CMD grails war --non-interactive /output/ROOT.war
