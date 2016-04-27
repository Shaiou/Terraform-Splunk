#!/bin/bash
set -x
exec 1> /var/tmp/mylog 2>&1

# Create local config files
sudo -u splunk mkdir -p /opt/splunk/etc/system/local
echo "${web_conf_content}" |sudo -u splunk tee /opt/splunk/etc/system/local/web.conf
echo "${server_conf_content}" |sudo -u splunk tee /opt/splunk/etc/system/local/server.conf
echo "${deploymentclient_conf_content}" |sudo -u splunk tee /opt/splunk/etc/system/local/deploymentclient.conf

# Update hostname
hostname splunk-${role}-`hostname`
echo `hostname` > /etc/hostname
sed -i 's/localhost$/localhost '`hostname`'/' /etc/hosts

# Start service and Enable autostart
sudo -u splunk /opt/splunk/bin/splunk enable boot-start -user splunk --accept-license
sudo -u splunk /opt/splunk/bin/splunk start --accept-license
