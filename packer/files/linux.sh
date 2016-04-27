#!/bin/bash

sleep 5

sudo useradd -b /home -c "Splunk dedicated user" --user-group --create-home -s "/bin/bash" splunk
cat <<EOF |sudo -u splunk tee -a /home/splunk/.bashrc
alias ll='ls -lrt'
export PATH=\$PATH:/opt/splunk/bin
cd /opt/splunk/etc
EOF
cd /opt
sudo tar -zxvf /var/tmp/splunk.tar.gz
sudo chown -R splunk:splunk /opt/splunk
