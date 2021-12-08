# Requirement
Basic Linux/Unix knowledge
Service provider networking knowledge


# Overview
freeRouter is a free, open source router control plane software, freeRouter besides Ethernet, is able to handle HDLC, X25, frame-relay, ATM encapsulation. Since it handles packets itself at the socket layer, it is independent of underlying Operation System capabilities.

The command line tries to mimic the industry standards with one exception:

no global routing table: every routed interface must be in a virtual routing table positive side effect: there are no vrf-awareness questions
In order to be able to start a topology with PolKa. 

# Article objective
This article exposes how to install:
- tmux
- Operating system supported:
  - Debian 10 (stable aka buster)
  - Ubuntu 18.04 (Bionic beaver)
  - Ubuntu 20.04 (Focal fossa)

# Diagram 
![rare-topology](https://user-images.githubusercontent.com/56919528/145196623-cc872b6d-7c48-4d83-9410-e6f2e1e23836.jpeg)

# Cookbook
1. Install you favorite operation system or use our virtualbox image:
  - Install your OS, like Ubuntu 18.04 MinimalCD 64-bit PC (amd64, x86_64) 64MB:
  ```
  http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/mini.iso
  ```
  - Install freeRouter
  ``` zsh
  wget freertr.net/install.sh ; sudo bash install.sh
  ```
Or download our image:
  - In our example we will use the Ubuntu 20.04 installed as a VirtualBox VM:
  ```
  https://drive.google.com/file/d/1tOLUS3VdMrvoLfts85mWcuk2IRK49yQ5/view?usp=sharing
  ```
2. Start & connect your VM as root.  

3. Install tmux and git:
``` zsh
apt install tmux git -y
```

4. Clone repository:
```
cd 
git clone git@github.com:eversonscherrer/freertr.git
```

5. Set permission exec start/stop topology
```
chmod +x start.sh
chmod +x stop.sh
```
To run the topology `./start.sh` To stop the topology `./stop.sh`.

# Verification
1. Check telnet access for AMS0001@2121, FRA0001@2222, BUD0001@2323 and POZ0001@2424:

AMS0001 telnet access from Virtualbox VM guest via port 2121
``` console
# telnet 127.0.0.1 2121
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
welcome
line ready
AMS0001#
```

FRA0001 telnet access from Virtualbox VM guest via port 2222
``` console
# telnet 127.0.0.1 2222
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
welcome
line ready
FRA0001#
```

BUD0001 telnet access from Virtualbox VM guest via port 2323
``` console
# telnet 127.0.0.1 2323
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
welcome
line ready
BUD0001#
```

POZ0001 telnet access from Virtualbox VM guest via port 2424
``` console
# telnet 127.0.0.1 2424
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
welcome
line ready
POZ0001#
```

# Conclusion
In this 2nd article you:
- had a showcase on how to implement a fully disaggregated RARE/freeRtr
- even if the control plane and the interface can be run almost anywhere, the dataplane still needs to be specific and adapted to the use case you planned to deploy
- pcapInt tool is a nitty gritty tool used to bind existing ports to a UDP socket tunnel.
