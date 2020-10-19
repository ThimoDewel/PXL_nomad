#!/bin/bash

# Server consul
mkdir temp
cd temp
touch keygen.txt
ls -a
consul keygen > keygen.txt
cd 

consul tls ca create

consul tls cert create -server -dc dc1

consul tls cert create -client -dc dc1
consul tls cert create -client -dc dc1


# Server -> Client 1
scp consul-agent-ca.pem dc1-client-consul-0.pem dc1-client-consul-0-key.pem root@192.168.100.11:/etc/consul.d/
# Server -> Client 2
scp consul-agent-ca.pem dc1-client-consul-1.pem dc1-client-consul-1-key.pem root@192.168.100.12:/etc/consul.d/

# Server consul.hcl     $(cat filename)

cat <<'EOT' > /etc/consul.d/consul.hcl

datacenter = "dc1"
data_dir = "/opt/consul"
encrypt = "qDOPBEr+/oUVeOFQOnVypxwDaHzLrD+lvjo5vCEBbZ0="
ca_file = "/etc/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul.d/dc1-server-consul-0.pem"
key_file = "/etc/consul.d/dc1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true


EOT