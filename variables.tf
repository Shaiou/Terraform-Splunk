## AWS Specific part
variable  "ami"                             {}
variable  "instance_user"                   {}
variable  "key_name"                        {}
variable  "package_manager"                 {}

variable  "region"                          {}
variable  "pretty_name"                     { default = "splunk" }
variable  "vpc_id"                          {}

#AZ lists and subnets must be comma separated lists in the same order ( subnet 1 must be in AZ 1)
variable  "availability_zones"              {}
variable  "subnets"                         {}
#admin cidr for ssh and web access
variable  "admin_cidr_block"                {}

## Instance/elb/asg specs
variable  "instance_type_indexer"           {}
variable  "instance_type_deploymentserver"  {}
variable  "instance_type_master"            {}
variable  "instance_type_searchhead"        {}
variable  "count_searchhead"                { default = 2 }
#Min will be based on replication factor
variable  "asg_indexer_desired"             { default = 2 }
variable  "asg_indexer_max"                 { default = 2 }
## Splunk Package Info
variable  "s3_bucket"                       {}
variable  "s3_path"                         { default = "splunk" }
variable  "package"                         {}
variable  "basedir"                         { default = "/opt" }
## Splunk Settings
variable  "httpport"                        { default = 8000 }
variable  "indexer_volume_size"             { default = "50" }
variable  "mgmtHostPort"                    { default = 8089 }
variable  "pass4SymmKey"                    {}
variable  "replication_factor"              { default = 2 }
variable  "replication_port"                { default = 9887 }
variable  "search_factor"                   { default = 2 }
variable  "user"                            { default = "splunk" }
variable  "group"                           { default = "splunk" }
