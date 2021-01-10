job "alertmanager" {
    datacenters = ["dc1"]
    type = "service"

    group "alertmanager" {
        count = 1
        network {
            port "alertmanager"{
                to = 9093
                static = 9093
            }
        }

        task "alertmanager" {
            driver = "docker"

            config {
                image = "prom/alertmanager"                
                ports = ["alertmanager"]
                volumes = [
                    "/opt/alertmanager/:/etc/alertmanager/",     
                ]

                logging {
                    type = "journald"
                    config {
                        tag = "alertmanager"
                    }
                }
            }
        
            service {
                name = "alertmanager"
                tags = ["alertmanager"]
                port = "alertmanager"
            }
        }
    }
}