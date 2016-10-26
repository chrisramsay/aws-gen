FROM python:2.7
MAINTAINER Chris Ramsay <chris@ramsay-family.net>

# Build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date="2016-10-26T18:29:46Z" \
      org.label-schema.name="aws-gen" \
      org.label-schema.description="Machine for interacting with AWS infrastructure" \
      org.label-schema.url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vcs-ref="4f5eb14" \
      org.label-schema.vcs-url="https://github.com/chrisramsay/aws-gen" \
      org.label-schema.vendor="Chris Ramsay" \
      org.label-schema.version="0.10.0" \
      org.label-schema.schema-version="1.0"

RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD files/bashrc /root/.bashrc
