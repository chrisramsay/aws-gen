# aws-gen

## Intro

Generalised Docker container for AWS & other tasks. Has support for the following:

* vi - because you always need `vi` some time.
* ipython - nice interactive Python shell.
* boto3 - Python library for using AWS.
* pika - Python library for RabbitMQ.
* python-consul - Python library for Consul.
* Fabric - Python library for scipting general remote server tasks.
* AWS CLI - Command line interface for using Amazon Web Services.

## General Use

Copy the `run.sh.tpl` file to something else, say, `run.sh` and add in your AWS details:

```bash
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
```

To run the container:

`$ ./run.sh`

Edit the `run.sh` file to add as many extra mount commands as you need, as well as adding any credentials you might want to access AWS and Consul.

## Extras

The Dockerfile ADDs a `bashrc` file to give an extra few niceties on the command line:

* Coloured command line prompt with machine name
* A handful of shell aliases
* AWS command line tab completion (see below)

AWS CLI comes with command completion set up so that you can tab away all those spare keyboard strokes:

```bash
aws-gen:/srv$ aws s<TAB>
s3               sdb              ses              snowball         sqs              storagegateway   support
s3api            servicecatalog   sms              sns              ssm              sts              swf
```

***

[![](https://images.microbadger.com/badges/image/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own version badge on microbadger.com")
