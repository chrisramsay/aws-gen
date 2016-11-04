FROM python:2.7
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="2016-10-28T04:45:20Z" \
      org.label-schema.name="aws-gen" \
      org.label-schema.description="Machine for interacting with AWS infrastructure" \
      org.label-schema.url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vcs-ref="dd1ad0a990eefd64853b122ea96b1949e64084d3" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/aws-gen.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.14.0" \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git \
  groff

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD files/bashrc /root/.bashrc
