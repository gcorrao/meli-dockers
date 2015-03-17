#!/bin/bash
grails refresh-dependencies --non-interactive
grails war --non-interactive /output/ROOT.war
