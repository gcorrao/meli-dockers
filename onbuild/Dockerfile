# Base image for building grails application
FROM mlarq/grails:latest
MAINTAINER Simonassi Luis Dario version: 0.1

ONBUILD RUN mkdir -p /output
ONBUILD COPY ./ /sources
ONBUILD WORKDIR /sources
ONBUILD CMD grails war --non-interactive /output/ROOT.war
