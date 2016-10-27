FROM python:2.7
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

# Build-time metadata as defined at http://label-schema.org
ARG 2016-10-27T13:11:50Z
ARG ae5a7322a7671e7dfd5d216a3a2a81a2f21391fc
ARG git@github.com:chrisramsay/aws-gen.git
ARG 0.13.0
LABEL org.label-schema.build-date="2016-10-27T13:11:50Z" \
      org.label-schema.name="aws-gen" \
      org.label-schema.description="Machine for interacting with AWS infrastructure" \
      org.label-schema.url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vcs-ref="ae5a7322a7671e7dfd5d216a3a2a81a2f21391fc" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/aws-gen.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.13.0" \
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
