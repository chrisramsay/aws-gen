# docker-boto-aws
Docker machine for working on AWS projects.

```
docker run \
-p 80:8888 \
-v ~/Testing:/project \
-e AWS_ACCESS_KEY=MY_ACCESS_KEY \
-e AWS_SECRET_KEY=MY_SECRET_KEY \
-e EC2_URL=https://ec2.eu-west-1.amazonaws.com \
-ti chrisramsay/docker-boto-aws \
/bin/bash
```