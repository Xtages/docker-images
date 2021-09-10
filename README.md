# docker-images
Docker images use by Xtages for CI, CD and GitHub webhooks.

## Mapping of current images
|Image|ECR repo|description|
|---|---|---|
|NodeJS 15.13.0-alpine3.13|xtages-build-images/node_ci|docker image to run CI operations|
|NodeJS 15.13.0-alpine3.13|xtages-build-images/node_cd|docker image to run CD operations|

# Release process
Currently, we don't have automation for this so whenever a change is done to any of the Dockerfile we need to release
by pushing the new image to ECR.

```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 605769209612.dkr.ecr.us-east-1.amazonaws.com
docker build --tag 605769209612.dkr.ecr.us-east-1.amazonaws.com/{reponame}:{version}
docker push 605769209612.dkr.ecr.us-east-1.amazonaws.com/{reponame}:{version}
```
