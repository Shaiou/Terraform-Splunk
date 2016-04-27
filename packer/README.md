1.Basic Packer to create an ami in eu-west-1 with:
- user/group : splunk
- splunk package untarred in /opt/splunk
- /opt/splunk owner by splunk
- splunk set to autostart with the server

2. Params folder contains var file according to the OS you want to use (only Linux supported at the time ). You can add a var file with your AWS vpc and subnet info

3. You must keep a copy of your splunk package with the name formatted as splunk-VERSION.tar.gz ( i.e: splunk-6.4.0.tar.gz )a in the files subfolder
