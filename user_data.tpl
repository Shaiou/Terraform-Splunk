#!/bin/bash
set -x
exec 1> /var/tmp/mylog 2>&1

# Create user
useradd -b /home -c "Splunk dedicated user" --user-group --create-home -s "/bin/bash" ${user}

# Download/extract package
apt-get install -y awscli
aws s3 cp ${s3_url} /tmp --region ${region}
cd ${basedir}
tar -zxvf /tmp/${package}

# Create local config files
mkdir -p ${splunk_dir}/etc/system/local
echo "${web_conf_content}" > ${splunk_dir}/etc/system/local/web.conf
echo "$${server_conf_content}" > ${splunk_dir}/etc/system/local/server.conf
echo "$${deploymentclient_conf_content}" > ${splunk_dir}/etc/system/local/deploymentclient.conf
chown -R ${user}:${group} ${basedir}

# Update hostname
hostname splunk-$${role}-`hostname`
echo `hostname` > /etc/hostname
sed -i 's/localhost$/localhost '`hostname`'/' /etc/hosts

# Set service to autostart and then start it
${splunk_dir}/bin/splunk enable boot-start -user ${user} --accept-license
${splunk_dir}/bin/splunk start --accept-license
