#!/bin/bash

cat <<'EOT' >> /etc/nomad.d/client2.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client2"

client {
  enabled = true
}

EOT


nomad agent -config=/etc/nomad.d/client2.hcl