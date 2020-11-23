#!/bin/bash

#nomad client2 config
cat <<'EOT' > /etc/nomad.d/nomad.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client2"


client {
  enabled = true
}

advertise{
http = "192.168.100.12:4646"
}

EOT

#dns resolve 
cat <<'EOT' >> /etc/resolv.conf
  nameserver  8.8.8.8
  nameserver  8.8.4.4

EOT
