job "prometheus"{
    datacenters = ["dc1"]
    type = "service"

    group "prometheus" {
        network {
            port "prometheus_port" {
                host_network = "private"
                to = 9090
                static = 9090
            }
        }
        service {
            name = "prometheus"
            port = "prometheus_port"
            tags = [
                "Metrics"
            ]
        }

        task "prometheus" {
            driver = "docker"
            config {
                image ="prom/prometheus:latest"
                ports = ["prometheus_port"]
                logging {
                    type = "journald"
                    config {
                        tag = "PROMETHEUS"
                    }
                }
            }
        }
    }
}
