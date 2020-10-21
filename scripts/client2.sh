#!/bin/bash

mkdir temp

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

#nomad agent -config=/etc/nomad.d/client2.hcl


#consul client1 config

cat << EOT > /etc/consul.d/consul.hcl

datacenter = "dc1"
data_dir = "/opt/consul"
server = true
encrypt = "$(cat /home/vagrant/temp/keygen.txt)"
ca_file = "/etc/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul.d/dc1-server-consul-2.pem"
key_file = "/etc/consul.d/dc1-server-consul-2-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.12"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]
EOT

systemctl start consul
systemctl start docker
systemctl start nomad