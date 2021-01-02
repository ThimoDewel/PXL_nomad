job "prometheus"{
    datacenters = ["dc1"]
    type = "service"

    group "prometheus" {
        network {
            port "prometheus_u1" {
                to = 9090
 #               static = 9090

            }
        }
        service {
            name = "prometheus"
            port = "prometheus_u1"
            tags = [
                "Metrics"
            ]
        }

        task "prometheus" {
            driver = "docker"
            config {
                image ="prom/prometheus:latest"
                ports = ["prometheus_u1"]
                logging {
                    type = "journald"
                    config {
                        tag = "PROMETEHUS"
                    }
                }
            }
        }
    }
}