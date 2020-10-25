#!/bin/bash

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


#nomad job 
cat <<'EOT' > ./webserver.nomad
job "webserver" {
  datacenters = ["dc1"]
  type = "service"

  group "webserver" {
     count = 2
    task "webserver" {
      driver = "docker"

      config {
        image = "httpd"
        force_pull = true
        port_map = {
          webserver_web = 80
        }
        logging {
          type = "journald"
          config {
            tag = "WEBSERVER"
          }
        }
      }

      service {
        name = "webserver"
        port = "webserver_web"
      }

      resources {
        network {
          port "webserver_web" {
            
          }
        }
      }
    }
  }
}
EOT



#dns resolve 
cat <<'EOT' >> /etc/resolv.conf
  nameserver  8.8.8.8
  nameserver  8.8.4.4

EOT
