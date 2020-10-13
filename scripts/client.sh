cat <<'EOT' >> /etc/nomad.d/client.hcl

datacenter = "dc1"
data_dir = "/opt/nomad/client1"

client {
  enabled = true
}

EOT


nomad agent -config=/etc/nomad.d/client.hcl