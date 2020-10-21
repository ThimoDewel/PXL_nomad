#!/bin/bash

#nomad server config
cat <<'EOT' > /etc/nomad.d/nomad.hcl


data_dir = "/opt/nomad/server"


server {
  enabled          = true
  bootstrap_expect = 1
}


advertise{
http = "192.168.100.10:4646"
rpc = "192.168.100.10:4647"
serf = "192.168.100.10:4648"
}

EOT



# Server consul
mkdir temp
cd temp
touch keygen.txt
ls -a
consul keygen > keygen.txt
cd 
#
#consul tls ca create

#consul tls cert create -server -dc dc1

#consul tls cert create -client -dc dc1
#consul tls cert create -client -dc dc1

# server -> server
#scp consul-agent-ca.pem dc1-server-consul-0.pem dc1-server-consul-0-key.pem root@127.0.0.1:/etc/consul.d/
#cp consul-agent-ca.pem /etc/consul.d/
#cp dc1-server-consul-0.pem /etc/consul.d/
#cp dc1-server-consul-0-key.pem /etc/consul.d/
# Server -> Client 1
#scp consul-agent-ca.pem dc1-client-consul-0.pem dc1-client-consul-0-key.pem root@192.168.100.11:/etc/consul.d/
# Server -> Client 2
#scp consul-agent-ca.pem dc1-client-consul-1.pem dc1-client-consul-1-key.pem root@192.168.100.12:/etc/consul.d/

# Server consul.hcl     $(cat filename)

cat << EOT > /etc/consul.d/consul.hcl

datacenter = "dc1"
data_dir = "/opt/consul"
server = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.10"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]

EOT

#encrypt = "$(cat /home/vagrant/temp/keygen.txt)"
#ca_file = "/etc/consul.d/consul-agent-ca.pem"
#cert_file = "/etc/consul.d/dc1-server-consul-0.pem"
#key_file = "/etc/consul.d/dc1-server-consul-0-key.pem"
#verify_incoming = true
#verify_outgoing = true
#verify_server_hostname = true


systemctl start consul
systemctl start docker
systemctl start nomad


#nomad agent -config=/etc/nomad.d/server.hcl
