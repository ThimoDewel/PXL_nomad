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
mkdir client1
mkdir client2
touch keygen.txt
ls -a
consul keygen > keygen.txt
cd 


#consul client1 config

cat << EOT > /home/vagrant/temp/client1/consul.hcl


datacenter = "dc1"
data_dir = "/opt/consul"
server = true
encrypt = "$(cat /home/vagrant/temp/keygen.txt)"
ca_file = "/etc/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul.d/dc1-server-consul-1.pem"
key_file = "/etc/consul.d/dc1-server-consul-1-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.11"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]
EOT

#consul client2 config

cat << EOT > /home/vagrant/temp/client2/consul.hcl


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

# Server consul.hcl     $(cat filename)

cat << EOT > /etc/consul.d/consul.hcl

datacenter = "dc1"
data_dir = "/opt/consul"
server = true
encrypt = "$(cat /home/vagrant/temp/keygen.txt)"
ca_file = "/etc/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul.d/dc1-server-consul-0.pem"
key_file = "/etc/consul.d/dc1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
bootstrap_expect = 3
ui = true
client_addr = "0.0.0.0"
bind_addr = "192.168.100.10"
retry_join = ["192.168.100.10","192.168.100.11","192.168.100.12"]

EOT

consul tls ca create

consul tls cert create -server -dc dc1
consul tls cert create -server -dc dc1
consul tls cert create -server -dc dc1

#known_hosts toevoegen
mkdir ~/.ssh/
chmod 700 ~/.ssh
ssh-keyscan 192.168.100.11 >> ~/.ssh/known_hosts
ssh-keyscan 192.168.100.12 >> ~/.ssh/known_hosts

# server1 -> server1
cp consul-agent-ca.pem /etc/consul.d/
cp dc1-server-consul-0.pem /etc/consul.d/
cp dc1-server-consul-0-key.pem /etc/consul.d/

# Server1 -> Server 2
sshpass -p vagrant scp consul-agent-ca.pem dc1-server-consul-1.pem dc1-server-consul-1-key.pem root@192.168.100.11:/etc/consul.d
sshpass -p vagrant scp /home/vagrant/temp/client1/consul.hcl root@192.168.100.11:/etc/consul.d/consul.hcl
# Server1 -> Server 3
sshpass -p vagrant scp consul-agent-ca.pem dc1-server-consul-2.pem dc1-server-consul-2-key.pem root@192.168.100.12:/etc/consul.d
sshpass -p vagrant scp /home/vagrant/temp/client2/consul.hcl root@192.168.100.12:/etc/consul.d/consul.hcl


#enable services server1
systemctl start docker
systemctl start consul
systemctl start nomad

#enable services client1
sshpass -p vagrant ssh root@192.168.100.11 sudo systemctl start docker
sshpass -p vagrant ssh root@192.168.100.11 sudo systemctl start consul
sshpass -p vagrant ssh root@192.168.100.11 sudo systemctl start nomad

#enable services client2
sshpass -p vagrant ssh root@192.168.100.12 sudo systemctl start docker
sshpass -p vagrant ssh root@192.168.100.12 sudo systemctl start consul
sshpass -p vagrant ssh root@192.168.100.12 sudo systemctl start nomad
