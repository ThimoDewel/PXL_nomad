job "prometheus"{
    datacenters = ["dc1"]
    type = "service"

    group "prometheus" {
        network {
            port "prometheus_port" {
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
                volumes = ["/opt/prometheus/:/etc/prometheus/"]
                args = [
                    "--config.file=/etc/prometheus/prometheus.yml",
                    "--storage.tsdb.path=/prometheus",
                    "--web.console.libraries=/usr/share/prometheus/console_libraries",
                    "--web.console.templates=/usr/share/prometheus/consoles",
                    "--web.enable-admin-api"
                    ]
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
