job "grafana" {
    datacenters = ["dc1"]
    type = "service"

    group "grafana" {
        count = 1
    
        network {
            port "grafana_port"{
                to = 3000
                static = 3000
            }
        }

        task "grafana" {
            driver = "docker"

            config {
                image = "grafana/grafana"
                force_pull = true
            
                ports = ["grafana"]
                logging {
                    type = "journald"
                    config {
                        tag = "grafana_port"
                    }
                }
            }
        
            service {
                name = "grafana"
                tags = ["grafana"]
                port = "grafana_port"
            }
        }
    }
}