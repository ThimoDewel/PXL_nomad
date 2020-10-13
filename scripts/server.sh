#!/bin/bash

cat <<'EOT' >> /etc/nomad.d/server.hcl

data_dir = "/opt/nomad/server"

server {
  enabled          = true
  bootstrap_expect = 1
}

EOT

nomad agent -config=/etc/nomad.d/server.hcl
