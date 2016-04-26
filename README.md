# Introduction
1.This is the branch where you can fully customize your splunk user and base folder
2. It probably won't be maintained anymore, switching to a packer + terraform mode if you want to build a cluster with no access to the internet to download the package from S3


# Terraform-Splunk
1. Creates a poliy/role/instance profile to be able to download your splunk package from a specified s3 bucket/path
2. Creates an ELB pointing out to the elb search heads
3. Creates ( customisable number/ports/replication stuff )
 - Search heads
 - Cluster master
 - Peered Indexers in an autoscaling group
 - Deployment server ( clients will only be cluster master and search heads )
4. Creates Security Groups:
 - All ports/protocols between splunk servers
 - SSH and web access from a given admin cidr_block to all splunk servers
 - TCP 80 from anywhere to ELB
 - TCP port custom from  ELB to search heads


#TODO:
 - Add licence server
 - A lot of stuff
