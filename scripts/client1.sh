#!/bin/bash

#nomad client1 config
cat <<'EOT' >> /etc/nomad.d/client.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client1"

client {
  enabled = true
}

EOT

#nomad agent -config=/etc/nomad.d/client.hcl


#consul client1 config

cat << EOT > /etc/consul.d/consul.hcl


datacenter = "dc1"
data_dir = "/opt/consul"
server = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.11"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]
EOT


systemctl start consul