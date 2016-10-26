# aws-gen

## Intro

Generalised Docker container for AWS & other tasks. Has support for the following:

* ipython - nice interactive Python shell
* boto3 - for AWS
* pika - for RabbitMQ
* python-consul - for Consul
* Fabric - for general server tasks

## General Use

Copy the `run.sh.tpl` file to `run.sh` and add in your AWS details:

```bash
#!/bin/bash

docker rm -f boto-aws
docker run \
--name boto-aws \
-p 80:8888 \
-v ~/myproject:/project \
-e CONSUL_KEY= \
-e AWS_ACCESS_KEY_ID= \
-e AWS_SECRET_ACCESS_KEY= \
-e AWS_DEFAULT_REGION= \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti \
chrisramsay/aws-gen \
/bin/bash
```

To run the container:

`$ ./run.sh`

Edit the `run.sh` file to add as many extra mount commands as you need.

# Stuff

[![](https://images.microbadger.com/badges/image/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own version badge on microbadger.com")
