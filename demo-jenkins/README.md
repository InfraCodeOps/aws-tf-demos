# Terraform in Jenkins Pipeline

## Overview

This repository contains code for deploying infrastructure using Terraform in a Jenkins pipeline. The pipeline is defined in the `Jenkinsfile` and uses a Docker container with the necessary attributes to run the pipeline. The Terraform code is defined in `main.tf` and creates an AWS VPC and two subnets within that VPC.

## Setup

For this to work, you need to have a Docker container running with the necessary attriburtes.   Here's a command to create one:
```bash
docker run --name infra-cicd -d -p 8080:8080 -p 50000:50000 -e JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" -v $(which docker):/usr/local/bin/docker -v $(which terraform):/usr/local/bin/terraform -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -v ~/.aws:/root/.aws -v /home/wasadmin/labs:/labs:ro --privileged --user root jenkins/jenkins:2.424
```
The container includes the following attributes:

- The `jenkins/jenkins:2.424` image.
- The `infra-cicd` container name.
- Port mappings for `8080` and `50000`.
- The `JAVA_OPTS` environment variable with the `ALLOW_LOCAL_CHECKOUT` option.
- Volume mappings for the `docker` and `terraform` binaries, the Docker socket, the Jenkins home directory, and the AWS credentials file.
- The `--privileged` flag to run the container in privileged mode.
- The `--user root` flag to run the container as the root user.


Read the comments in the project files more info.  Have fun!