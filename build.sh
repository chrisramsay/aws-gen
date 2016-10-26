#!/bin/sh

#docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#             --build-arg VCS_REF=`git rev-parse --short HEAD` \
#             --build-arg VERSION=`cat VERSION` \
#             -t chrisramsay/aws-gen:0.9.0 .

BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
VCS_REF=`git rev-parse --short HEAD`
VERSION=`cat VERSION`

cp Dockerfile{.tmpl,}
sed -i.bak 's/BUILD_DATE/'"$BUILD_DATE"'/g' Dockerfile
sed -i.bak 's/VCS_REF/'"$VCS_REF"'/g' Dockerfile
sed -i.bak 's/VERSION/'"$VERSION"'/g' Dockerfile
rm -f Dockerfile.bak
