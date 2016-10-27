#!/bin/bash

docker rm -f aws-gen
docker run \
--name aws-gen \
-v ~/myproject:/project \
-e CONSUL_KEY= \
-e AWS_ACCESS_KEY_ID= \
-e AWS_SECRET_ACCESS_KEY= \
-e AWS_DEFAULT_REGION=eu-west-1 \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti \
chrisramsay/aws-gen \
/bin/bash
