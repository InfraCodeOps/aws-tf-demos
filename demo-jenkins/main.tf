terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
    }
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0" # pin to 5.x
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

// Since this is running inside a Docker
// container as part of a Jenkins pipeline
// you will find this file at the 
// following location: 
// /var/jenkins_home/workspace/<project-name>/goodday.txt
// you can verify by shelling into the container
// use: docker exec -it <container-id> /bin/bash
// then cd to the above path and cat the file

resource "local_file" "goodday_file" {
    content = "Good day!"
    filename = "goodday.txt"
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "jenkins-vpc"
  }
}