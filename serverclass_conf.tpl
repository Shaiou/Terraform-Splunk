[serverClass:sc_master]
stateOnClient = "noop"
whitelist.0 = ${master_ip}

[serverClass:sc_searchhead]
whitelist.0 = *
blacklist.0 = ${master_ip}
