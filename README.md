# aws-gen

## Intro

Generalised Docker container for AWS & other tasks. Has support for the following:

* vi - because you'll need `vi` at some point.
* AWS CLI - Command line interface for using Amazon Web Services.
* ipython - nice interactive Python shell.
* boto3 - Python library for using AWS.
* pika - Python library for RabbitMQ.
* requests - HTTP request handling library.
* python-consul - Python library for Consul.
* Fabric - Python library for scipting general remote server tasks.
* pycrypto - Crypt support library for Python.
* pylint - Keep your Python code up to scratch.
* redis - Redis support for Python.
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

## Build Script

There is a `build.sh` file packaged here. This is to help with further development of the container. One of a number of possible options must be passed at run time.

### build

Runs the standard `docker build` command with a few build arguments; tags as both verson and latest picking up build version from the `VERSION` file.

### release

Does not execute `docker build`. Instead modifies the `Dockerfile` replacing in-place values from the `Dockerfile.tmpl` with label values. This should be done prior to a tagged release.

### restore

Used in order to reinstate the normal `Dockerfile` for continuing development. Utility function only.

## Development Process

* Create a new release branch
* Change directory to the `build` directory
* Bump the version number in `build/VERSION`
* Run `$ ./build.sh restore` to set up a clean `Dockerfile`
* Make any required changes to `build/Dockerfile.tmpl`
* Run `$ ./build.sh build` to build current tag and latest
* Once all the work is complete, run `$ ./build.sh release`
* Merge and tag the release

***

[![](https://images.microbadger.com/badges/image/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/chrisramsay/aws-gen.svg)](https://microbadger.com/images/chrisramsay/aws-gen "Get your own version badge on microbadger.com")
