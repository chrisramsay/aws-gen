FROM python:2.7

RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git

WORKDIR /srv
ADD requirements.txt /srv/requirements.txt
ADD files/bashrc /root/.bashrc

RUN pip install -r requirements.txt