# M-PolKA
M-PolKA (Multipath Polynomial Key-based Architecture)is a topology-agnostic multipath source routing architecture, which explores special properties from the RNS polynomial arithmetic and redefines the RNS coding for the representation of multipath routes. Thus, a myriad of new avenues will be open, from duplication of traffic through disjoint routes to multicast trees, could be properly represented. Therefore, M-PolKA is expected to deliver not only topology-agnostic solutions for controlability, but also answers to end-to-end (E2E) performance issues.

# RARE/FreeRtr

Freertr is a control plane: Router OS process speaks various network protocols, (re)encap packets, and exports forwarding tables to hardware switches. Basically, it is only necessary to install the Java Runtime Environment (JRE). Below is demonstrated how to install it on operating systems: Linux, Windows and macOS.

<p align="center">
  <img src="https://github.com/eversonscherrer/freertr/blob/main/M-PolKA/img/freertr.png">
</p>


# Requirement

Basic Linux/Unix knowledge
Service provider networking knowledge

# Operating system supported
This point exposes how to install freerouter and execute a edge-core topology with PolKA.

- Debian 10 (stable aka buster)
- Ubuntu 18.04 (Bionic beaver)
- Ubuntu 20.04 (Focal fossa)

## Install JRE
### Linux
For demonstration purposes, the Debian-based Linux installation was chosen.
```console
sudo apt-get install default-jre-headless --no-install-recommends
```

### MacOS
```console
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk list java
sdk install java 17.0.2-open
sdk default java 17.0.2-open
java -version
```

### Windows
In order to install the Windows version of Java, you need to visit the official Java website and download the Windows executable. After the download, check if your user has permission to install and perform the installation through the graphical environment. 

## Install Freertr
The freeRouter homepage is at freertr.net. Starting from this page, you'll find various resources such as source code (there is also a GitHub mirror), binaries, and other images that might be of your interest. From there we just download the freeRouter jar files.


```console
sudo wget freertr.net/rtr.jar
````

# Launch the Topology
Now it's time to run the topology, to run it, download all the hardware and software files that are in the repository, in the same folder.

**NOTE**
> To orchestrate the execution of the topology we use ```tmux```, if you don't have it installed, remember to install it.
```console
sudo apte-get install tmux
or
brew install tmux
````
There is a file called ```start-topology.sh``` in the repository. This file orchestrates the execution of all routers in a single run.

Notice
That file has two environment variables It needs to be defined ```RTR``` and ```HWSW``` these point to the path freertr and router files.  

```console
sudo chmod +x start-topology.sh
./start-topology.sh
```

# M-PolKA Topology
We used this diagram to describe a M-PolKA demo scenario.

![Topology](https://github.com/eversonscherrer/freertr/blob/main/M-PolKA/img/topology.png)

# M-PolKA Experimentation

## To access the router, just access via telnet or ssh, in our demo, we use telnet.

```telnet <localhost> <port>```

For example, Access Router R5, to access another router, just change the port.
```console
telnet 127.0.0.1 2525
```