# LinuxPE-Groep20

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

### VagrantFile & Init script

In onze Vagrantfile hebben we gebruik gemaakt van een hash array en een loop om onze vagrant boxes op te zetten. Het voordeel aan deze aanpak is dat het gemakkelijk scalable is en dat het een duidelijk beeld geeft van welk boxes welke instellingen hebben.

Code snippet Vagrantfile:
``` Ruby
#Code snippet uit Vagrantfile
vms=[{
  :hostname => "Nomad-Server1",
  :ip => "192.168.100.10",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/server.sh"
}, 
{
  :hostname => "Nomad-Agent1",
  :ip => "192.168.100.11",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/client1.sh"
},
{
  :hostname => "Nomad-Agent2",
  :ip => "192.168.100.12",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/client2.sh"
}

#loop
vms.each do |machine|
    #do stuff
end
```
Voor het installeren en configureren van alle nodige services op onze boxes hebben wij gekozen om 4 scriptjes te gebruiken:

* [init.sh](scripts/init.sh)
    * algemeen script dat voor elke box gebruikt wordt (installeren van alle nodige tools)
* [server.sh](scripts/server.sh)
    * 
* [client1.sh](scripts/client1.sh)
    * 
* [client2.sh](scripts/client2.sh)
    * 



### Setup/Config Consul cluster

### Setup/Config Nomad cluster


[↑ Back to top ↑](#Inhoudsopgave) 

## Opgave 
### Deadline 26/10

Per 2 ([overzicht](https://docs.google.com/spreadsheets/d/1Q69y0qAsR0N5FGCZiHLzsOxO48YiUsMZfEyjJGxvy-g/edit#gid=0)), met behulp van de vagrant shell provisioner een nomad cluster opzetten door middel van de tijdens de les gebruikte technieken toe te passen.

Een productie waardige nomad cluster met consul als service discovery en docker als driver installeren, configureren en starten door gebruik te maken van de vagrant shell provisioner in een vagrant multi machine omgeving. 

In de vagrant file worden 3 vm's aangemaakt waarvan eentje zal dienen als nomad server en de overige 2 als nomad agent. Op de 3 nodes moet consul worden geinstalleerd en geconfigureerd als cluster waartegen de nomad server communiceert.

De nomad server consul configuratie mag geconfigureerd worden zodat de nomad agents automatisch joinen.

Nomad, consul en docker dienen te worden opgezet met systemd (de voorziene yum repository van HashiCorp mag gebruikt worden!)

Het commando vagrant up --provision is het enige commando dat gebruikt zal worden om jullie nomad setup op te brengen waarna er getracht zal worden om een simpele webserver job definitie op jouw cluster zal worden uitgetest.

Het eindresultaat dient via git te worden gepushed op de https://github.com/visibilityspots/PXL_nomad github repository op de branch van jouw team ten laatste op 26/10/2020 om 23:59:59.

Een README dient te worden opgesteld met een uitleg wat jullie gedaan hebben en waarom samen met een bron vermelding.

De quotering zal gebeuren enerzijds op het functionele aspect van je cluster, anderzijds wordt er ook gekeken naar het gebruik van best practices van de gehanteerde oplossing alsook de samenwerking tussen jullie beiden en een individuele bevraging tijdens het evaluatie moment.

[↑ Back to top ↑](#Inhoudsopgave) 

## Bronnen 

1. [Multi machine Vagrant](https://www.vagrantup.com/docs/multi-machine)
2. [looping over VM definitions](https://www.vagrantup.com/docs/vagrantfile/tips#loop-over-vm-definitions)
3. [RUBY array of hashes](https://stackoverflow.com/questions/4826129/how-to-create-an-array-of-hashes-in-ruby)
4. [Bron voorbeeld 1](https://www.google.be)
    * sub item 
    * sub item 

[↑ Back to top ↑](#Inhoudsopgave) 

