# Using Terraform and AWS provider please create EC2 instance, using specific AMI in default VPC.

## Introduction

Your fellow developers filled a request for one small EC2 instance. Requirements? t2.micro, ubuntu with ssh access.
Don't forget to tag this instance with appropriate description: owner => masters-of-destruction

## Expectations

The requirements are as follow:
* Create EC2 instance with: 
    * type: `t2.micro`
    * AMI: `ami-0be656e75e69af1a9`
    * Availability zone: `eu-central-1`
    * Tags: `owner` = `masters-of-destruction`
    * Security Group: please use aws security group resource that you will create in the next step 
    * SSH keypair: please use aws key pair resource that you will create in one of the next steps
* Create Security Group for SSH access from anywhere and use it for provisioning EC2 instance:
    * {to,from} port: `22`
    * protocol: `tcp`
    * cidr: `0.0.0.0/0`
* PEM Key:
    * please generate PEM using `tls_private_key` resource
    * `algorithm` = `RSA`
* SSH Keypair:
    * please create ssh keypair with key_name `ssh_key`
    * for `public_key` argument please use PEM from previously defined `tls_private_key` resource
* VPC:
    * default VPC (ready to use without any additional configuration)
    * Availability zone: `eu-central-1`
* Important: when it is possible please use the `availability_zone` = `eu-central-1`
* Your code doesn't use any existing modules and is composed of only plain resources provided by the official AWS Terraform provider

Good luck and make us proud!
