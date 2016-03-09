# aws-gen
Docker machine for working on AWS projects.

Has some general use libraries for the following:

 * AWS (boto3)
 * RabbitMQ (pika)
 * Consul (python-consul)
 * Fabric
 * iPython

## run.sh File

Copy the `run.sh.tpl` file to `run.sh` and add in your AWS details

```
#!/bin/bash

docker rm -f aws-gen
docker run \
--name boto-aws \
-p 80:8888 \
-v ~/Infrastructure/tools:/project \
-e CONSUL_KEY=374e7db5-385a-af49-e749-21e92585b03b \
-e AWS_ACCESS_KEY=AKIAIEMKIXG647GW5JXA \
-e AWS_SECRET_KEY=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 \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti \
chrisramsay/aws-gen \
/bin/bash
```

Then execute the `run.sh` file and off you go...
