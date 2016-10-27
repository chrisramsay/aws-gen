FROM python:2.7
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="aws-gen" \
      org.label-schema.description="Machine for interacting with AWS infrastructure" \
      org.label-schema.url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.vcs-url="$VCS_URL" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="$VERSION" \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update && apt-get install -y \
  vi \
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
