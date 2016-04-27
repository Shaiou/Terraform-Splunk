#Introduction
 - New version with packer for servers that don't have internet access to download package from S3.
 - In the packer vars, user is set to splunk and base folder to /opt
 - Check the packer/README.md to build your image and then use this ami in your terraform.tfvars variable
 - The OLD version is still available in branch fullcustom

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
