#!/bin/bash

img=aws-gen
docker rm -f ${img}
docker run \
--name ${img} \
-v ~/myproject:/project \
-e CONSUL_KEY= \
-e AWS_ACCESS_KEY_ID= \
-e AWS_SECRET_ACCESS_KEY= \
-e AWS_DEFAULT_REGION=eu-west-1 \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti \
chrisramsay/${img}:latest \
/bin/bash
