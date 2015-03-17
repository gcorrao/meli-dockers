#!/bin/bash
echo "Running grails refresh-dependencies"
grails refresh-dependencies --non-interactive
echo "Running grails run-app"
grails run-app --non-interactive
