#!/bin/sh

do_build_latest()
{
    docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                 --build-arg VCS_REF=`git rev-parse HEAD` \
                 --build-arg VCS_URL=`git config --get remote.origin.url` \
                 --build-arg VERSION=`cat VERSION` \
                 -t chrisramsay/aws-gen:latest .
}

do_build_version()
{
    docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                 --build-arg VCS_REF=`git rev-parse HEAD` \
                 --build-arg VCS_URL=`git config --get remote.origin.url` \
                 --build-arg VERSION=`cat VERSION` \
                 -t chrisramsay/aws-gen:`cat VERSION` .
}

do_prepare()
{
    BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
    VCS_REF=`git rev-parse HEAD`
    VCS_URL=`git config --get remote.origin.url`
    VERSION=`cat VERSION`

    cp Dockerfile{.tmpl,}
    sed -i.bak 's#$BUILD_DATE#'"$BUILD_DATE"'#g' Dockerfile
    sed -i.bak 's#$VCS_REF#'"$VCS_REF"'#g' Dockerfile
    sed -i.bak 's#$VCS_URL#'"$VCS_URL"'#g' Dockerfile
    sed -i.bak 's#$VERSION#'"$VERSION"'#g' Dockerfile
    rm -f Dockerfile.bak
}

do_restore()
{
    cp Dockerfile{.tmpl,}
}

case "$1" in
    build-latest)
        do_build_latest
        ;;
    build-version)
        do_build_version
        ;;
    prepare)
        do_prepare
        ;;
    restore)
        do_restore
        ;;
*)
echo "Usage: $NAME {build-latest|build-version|prepare|restore}" >&2
exit 1
esac

exit 0
