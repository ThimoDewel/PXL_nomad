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
- [ ] best practice (encyption, ...)


[↑ Back to top ↑](#Inhoudsopgave) 

## Uitwerking opdracht



[↑ Back to top ↑](#Inhoudsopgave) 

## Opgave 
### deadline 30/11 23:59:59

Per 2 ([overzicht](https://docs.google.com/spreadsheets/d/1Q69y0qAsR0N5FGCZiHLzsOxO48YiUsMZfEyjJGxvy-g/edit#gid=0)), met behulp van vagrant de nomad cluster uit de eerste opdracht nu niet met bash maar met ansible of puppet op brengen. Maak hiervoor gebruik van de puppet of ansible provisioner.

Er dienen voor deze opdracht verschillende modules geschreven te worden als ook roles (en profiles) samen met een node manifest of play. Het gebruik van parameters en templates voor de configuraties waar nodig wordt ten zeerste aangeraden!

Verdeel het werk onderling, zodanig ieder zelf code schrijft en dit ook duidelijk wordt uit de git history.

Nomad en consul te werken zoals beoogd in de eerste opdracht! Er zal ook deze keer gekeken worden met behulp van een nomad job file of de cluster werkt zoals vooropgesteld.

Het eindresultaat dient via git te worden gepushed via de https://github.com/visibilityspots/PXL_nomad github repository op de branch van jouw team ten laatste op 30/11/2020 om 23:59:59.

Een README dient te worden opgesteld met een uitleg wat jullie gedaan hebben,waarom, op welke manier de taken verdeeld werden samen met een bron vermelding.

De quotering zal gebeuren enerzijds op het functionele aspect van je cluster, anderzijds wordt er ook gekeken naar het gebruik van best practices van de gehanteerde oplossing alsook de samenwerking tussen jullie beiden en een individuele bevraging tijdens het evaluatie moment.

[↑ Back to top ↑](#Inhoudsopgave) 

## Bronnen 

1. [Multi machine Vagrant](https://www.vagrantup.com/docs/multi-machine)
2. [RUBY array of hashes](https://stackoverflow.com/questions/4826129/how-to-create-an-array-of-hashes-in-ruby)
3. Hashicorp docs: nomad & consul
    * [Consul](https://learn.hashicorp.com/tutorials/consul/deployment-guide)
    * [Nomad](https://learn.hashicorp.com/collections/nomad/get-started)
4. [Consul cluster setup guide](https://devopscube.com/setup-consul-cluster-guide/)
5. [Ansible local provisioning with Vagrant](https://www.vagrantup.com/docs/provisioning/ansible_local)
6. [Ansible documentation](https://docs.ansible.com/)


[↑ Back to top ↑](#Inhoudsopgave) 
