job "node-exporter" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    count = 2  #amount of nodes

    network {
      port "node-exporter" {
        to = 9100
      }
    }

    task "node-exporter" {
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
        ports = ["node-exporter"]
        logging {
          type = "journald"
          config {
            tag = "NODE-EXPORTER"
          }
        }
      }

      service {
        name = "node-exporter"
                address_mode = "driver"
        tags = [
          "metrics"
        ]
        port = "node-exporter"


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
