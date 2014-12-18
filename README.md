**This branch uses Hortonworks HDP 2.2**. Note that HDP 2.2 on Ubuntu does not ship with Hue and will require manual installation of Hue at this time.

## Specs

The cluster conists of 3 nodes:

* Master node with 6GB of RAM (Running the NameNode, Hue, ResourceManager etc. after installing the Hadoop services)
* 2 workers with 2GB of RAM each (Running DataNodes)

As you can see, you'll need at least 10GB of free RAM to run this. If you have less, you can try to remove one machine from the Vagrantfile. This will lead to worse performance though!

## Usage

Depending on the hardware of your computer, installation will probably take between 15 and 25 minutes.

First install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/).

Install the Vagrant [Hostmanager plugin](https://github.com/smdahlen/vagrant-hostmanager)

```bash
$ vagrant plugin install vagrant-hostmanager
```

Clone this repository.

```bash
$ git clone https://github.com/maxfierke/vagrant-hadoop-cluster.git -b hadoop-hdp
```

Provision the bare cluster. It will ask you to enter your password, so it can modify your `/etc/hosts` file for easy access in your browser. It uses the Vagrant Hostmanager plugin to do this.

```bash
$ cd vagrant-hadoop-cluster
$ vagrant up
```

Go to [Ambari (http://hadoop-hdp-master:8080)](http://hadoop-hdp-master:8080) and follow the Hortonworks HDP 2.2 [Installing HDP Using Ambari](http://docs.hortonworks.com/HDPDocuments/Ambari-1.7.0.0/Ambari_Install_v170/index.html#Item3.1) guide.


**Done!** Have fun with your Hadoop cluster.
