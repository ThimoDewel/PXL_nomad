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
retry_join = ["192.168.100.10"]


EOT


systemctl start consul