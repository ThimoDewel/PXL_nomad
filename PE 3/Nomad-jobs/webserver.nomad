job "webserver" {
  datacenters = ["dc1"]
  type = "service"

  group "webserver" {
    count = 2

    network {
      port "webserver_web" {
        to = 80
      }
      port "webserver_metrics"{
        to = 9117
      }
    }

    service {
        name = "webserver"
        port = "webserver_web"
        tags = [
            "webserver"
        ]
    }

    task "webserver" {
      driver = "docker"

      config {
        image = "httpd"
        force_pull = true
        ports = ["webserver_web"]
        logging {
          type = "journald"
          config {
            tag = "WEBSERVER"
          }
        }
      }

      service {
        name = "webserver"
      }
    }

      task "apache-exporter" {
          driver = "docker"

          config {
              image = "bitnami/apache-exporter"
              force_pull = true
          
               ports = ["webserver_metrics"]
              logging {
                  type = "journald"
                  config {
                       tag = "apache-exporter"
                  }
              }
            args = [ "--scrape_uri=https://127.0.0.1/server-status/?auto"]
          }
        
            service {
                name = "apache-exporter"
                port = "webserver_metrics"
                tags = ["metrics"]
            }
        }
  }
}