FROM python:latest
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="2017-06-05T10:11:12Z" \
      org.label-schema.name="aws-gen" \
      org.label-schema.description="Machine for interacting with AWS infrastructure" \
      org.label-schema.url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vcs-ref="9d0405ec99f809c682235f1232192e7e5fc261d2" \
      org.label-schema.vcs-url="git@github.com:chrisramsay/aws-gen.git" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.14.0" \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git \
  groff \
  vim

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD files/bashrc /root/.bashrc
