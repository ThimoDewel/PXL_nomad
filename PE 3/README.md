# LinuxPE-Groep20 (opdracht 2)

## Inhoudsopgave
[TO-DO / DONE list](#to-do--done) <br/>
[Uitleg uitwerking opdracht](#Uitwerking-opdracht) <br/>
[opgave](#Opgave) <br/>
[Bronnen](#Bronnen) <br/>

## TO-DO / DONE

- [x] Vagrant file (3VM's)
- [x] Consul cluster
- [x] Nomad cluster
- [x] Node Exporter (all nodes)
- [ ] Prometheus, alertmanager, grafana
- [ ] best practice (encryption, ...)


[↑ Back to top ↑](#Inhoudsopgave) 

## Uitwerking opdracht



[↑ Back to top ↑](#Inhoudsopgave) 

## Opgave 
### deadline 11/01 23:59:59

Per 2 ([overzicht](https://docs.google.com/spreadsheets/d/1Q69y0qAsR0N5FGCZiHLzsOxO48YiUsMZfEyjJGxvy-g/edit#gid=0))met behulp van vagrant de nomad cluster uit de tweede opdracht monitoring opzetten op basis van metrics (prometheus, alertmanager, grafana)
Deze dienen allen als container te worden gestart op de nomad cluster. Ook de node-exporter dient als container te worden opgespint op ALLE nodes.
De setup dient te worden geconfigureerd zodanig je nomad/consul cluster gemonitord wordt alsook een extra zelf uit te kiezen applicatie (ook een nomad job waarvan je de metrics binnenhaalt)
De prometheus en alertmanager targets liefst dynamisch geconfigureerd zoals geillustreerd tijdens de les. Dashboards dienen te worden voorzien via grafana, de json export plaats je in je git repository zodanig ze kunnen worden geimporteerd tijdens de evaluatie.
Er dient van deze jobs niets automatisch te worden opgezet via vagrant up (mag wel) de nomad jobs dienen wel aanwezig te zijn in de git repository!
Tijdens het evaluatie moment dient er een vagrant destroy vagrant up te gebeuren waarna jullie stap voor de stap door de monitoring jobs lopen, manueel starten, eventuele grafana configuratie toepassen en de dashboards inladen.
Verdeel het werk onderling, zodanig ieder zelf code schrijft en dit ook duidelijk wordt uit de git history.
Het eindresultaat dient via git te worden gepushed via de https://github.com/visibilityspots/PXL_nomad github repository op de branch van jouw team ten laatste op 11/01/2021 om 23:59:59.
Een README dient te worden opgesteld met een uitleg wat jullie gedaan hebben, waarom, op welke manier de taken verdeeld werden samen met een bron vermelding.
De quotering zal gebeuren enerzijds op het functionele aspect van je cluster en de monitoring ervan, anderzijds wordt er ook gekeken naar het gebruik van best practices van de gehanteerde oplossing alsook de samenwerking tussen jullie beiden en een individuele bevraging tijdens het evaluatie moment.

[↑ Back to top ↑](#Inhoudsopgave) 

## Bronnen 

1. [Multi machine Vagrant](https://www.vagrantup.com/docs/multi-machine)
2. [RUBY array of hashes](https://stackoverflow.com/questions/4826129/how-to-create-an-array-of-hashes-in-ruby)
3. Hashicorp docs: nomad & consul
    * [Consul](https://learn.hashicorp.com/tutorials/consul/deployment-guide)
    * [Nomad](https://learn.hashicorp.com/collections/nomad/get-started)
4. [Consul cluster setup guide](https://devopscube.com/setup-consul-cluster-guide/)
5. [Prometheus alerts](https://awesome-prometheus-alerts.grep.to/rules.html)
6. [Prometheus alerting rules](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/)
7. [Nomad-consul-prometheus git repo](https://github.com/visibilityspots/nomad-consul-prometheus)
[↑ Back to top ↑](#Inhoudsopgave) 
