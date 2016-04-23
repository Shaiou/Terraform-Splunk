[replication_port://${replication_port}]

[clustering]
mode = slave
master_uri = https://${master_ip}:${mgmtHostPort}
pass4SymmKey = ${pass4SymmKey}
