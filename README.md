# docker-boto-aws
Docker machine for working on AWS projects.

## run.sh File

Copy the `run.sh.tpl` file to `run.sh` and add in your AWS details

```
#!/bin/bash

docker run \
-p 80:8888 \
-v ~/myproject:/project \
-e AWS_ACCESS_KEY= \
-e AWS_SECRET_KEY= \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti \
chrisramsay/boto-aws \
/bin/bash
```

Then execute the `run.sh` file and off you go...