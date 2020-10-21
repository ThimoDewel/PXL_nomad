#!/bin/bash
mkdir temp

#nomad client1 config
cat <<'EOT' > /etc/nomad.d/nomad.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client1"


client {
  enabled = true
}

advertise{
http = "192.168.100.11:4646"
}

EOT
