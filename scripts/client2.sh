#!/bin/bash

#nomad client2 config
cat <<'EOT' >> /etc/nomad.d/client2.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client2"

client {
  enabled = true
}

EOT

#nomad agent -config=/etc/nomad.d/client2.hcl


#consul client1 config

cat << EOT > /etc/consul.d/consul.hcl

datacenter = "dc1"
data_dir = "/opt/consul"
server = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.12"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]
EOT

systemctl start consul