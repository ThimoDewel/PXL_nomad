job "node_exporter" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    count = 2  #amount of nodes

    network {
      port "node_exporter" {
        to = 9100
      }
    }

    task "node_exporter" {
      driver = "docker"
      
      resources {
        cpu    = 50
        memory = 100
      }

      config {
        image = "prom/node-exporter:v0.17.0"
        force_pull = true
        volumes = [
          "/proc:/host/proc",
          "/sys:/host/sys",
          "/:/rootfs"
        ]
        ports = ["node_exporter"]
        logging {
          type = "journald"
          config {
            tag = "NODE_EXPORTER"
          }
        }
      }

      service {
        name = "node_exporter"
                address_mode = "driver"
        tags = [
          "metrics"
        ]
        port = "node_exporter"


        check {
          type = "http"
          path = "/metrics/"
          interval = "10s"
          timeout = "2s"
        }
      }
    }
  }
}