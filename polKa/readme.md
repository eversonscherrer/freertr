# Requirement
Basic Linux/Unix knowledge
Service provider networking knowledge


# Overview
In order to be able to start a topology with PolKa(melhorar). 

# Article objective
This article exposes how to install:
- tmux
- Operating system supported:
  - Debian 10 (stable aka buster)
  - Ubuntu 18.04 (Bionic beaver)
  - Ubuntu 20.04 (Focal fossa)

# Diagram 
![rare-topology](https://user-images.githubusercontent.com/56919528/145196623-cc872b6d-7c48-4d83-9410-e6f2e1e23836.jpeg)

# Modular design
1. Install you Favorite Operation System
In our example we will use the ubuntu 20.04 installed as a VirtualBox VM
```
apt install tmux
chmod +x start.sh chmod +x stop.sh
```
To run the topology `./start.sh` To stop the topology `./stop.sh`.

2. Install freeRouter
```
wget freertr.net/install.sh ; sudo bash install.sh
```

3.  


# Verification

# Discussion

# Conclusion
In this 2nd article you:
- had a showcase on how to implement a fully disaggregated RARE/freeRtr
- even if the control plane and the interface can be run almost anywhere, the dataplane still needs to be specific and adapted to the use case you planned to deploy
- pcapInt tool is a nitty gritty tool used to bind existing ports to a UDP socket tunnel.
