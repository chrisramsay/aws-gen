#!/bin/sh

docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
             --build-arg VCS_REF=`git rev-parse HEAD` \
             --build-arg VERSION=`cat VERSION` \
             -t chrisramsay/aws-gen:`cat VERSION` .
