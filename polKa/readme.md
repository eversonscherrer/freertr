# Requirement
Basic Linux/Unix knowledge
Service provider networking knowledge


# Overview
FreeRouter is a free, open source router control plane software, freeRouter besides Ethernet, is able to handle HDLC, X25, frame-relay, ATM encapsulation. Since it handles packets itself at the socket layer, it is independent of underlying Operation System capabilities. The command line tries to mimic the industry standards with one exception:

PolKA: Polynomial Key-based Architecture for Source Routing in Network Fabrics.

In order to be able to start a topology with PolKa. 

# Article objective
This article exposes how to install freerouter and execute a core topology with PolKA.

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

Or download our image:
  - In our example we will use the Ubuntu 20.04 installed as a VirtualBox VM:

  ![print VB](https://user-images.githubusercontent.com/56919528/145298486-9fe68011-3c7b-4eec-9680-91a8391b350d.png)

  ```
  https://drive.google.com/file/d/1tOLUS3VdMrvoLfts85mWcuk2IRK49yQ5/view?usp=sharing
  ```
2. Start & connect your VM as root.  
``` console
User: freertr
password: rtr
sudo -i
```

3. Install tmux and git:
``` console
apt install tmux -y
apt install git -y
```

4. Clone repository:
``` console
cd ~
git clone git@github.com:eversonscherrer/freertr.git
```

5. Set permission exec start/stop topology
``` console
cd freertr/polKa
chmod +x start.sh
chmod +x stop.sh
```
To run the topology `./start.sh` To stop the topology `./stop.sh`.
``` console
./start.sh
```

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

2. Check running-config for tunnel polka in RIO0001 to GVA0001
``` console
RIO0001#show running-config interface tunnel1
```
```
interface tunnel1
 description POLKA tunnel from RIO0001 -> GVA0001
 tunnel vrf v1
 tunnel source loopback0
 tunnel destination 20.20.20.7
 tunnel domain-name 20.20.20.1 20.20.20.2
 tunnel mode polka
 vrf forwarding v1
 ipv4 address 30.30.30.1 255.255.255.252
 no shutdown
 no log-link-change
 exit
!
```

``` console
RIO0001#show interfaces summary | include tunnel1
```

```
tunnel1    up     0      0      0
```

3. Check running-config for tunnel polka in GVA0001 to RIO0001
``` console
GVA0001#show running-config interface tunnel1
```
```
interface tunnel1
 description POLKA tunnel from GVA0001 -> RIO0001
 tunnel vrf v1
 tunnel source loopback0
 tunnel destination 20.20.20.11
 tunnel domain-name 20.20.20.2 20.20.20.1
 tunnel mode polka
 vrf forwarding v1
 ipv4 address 30.30.30.2 255.255.255.252
 no shutdown
 no log-link-change
 exit
!
```

``` console
GVA0001#show interfaces summary | include tunnel1
```

```
tunnel1    up     0      0      0
```

4. Connectivity test tunnel polka between RIO0001 to GVA0001
``` console
RIO0001#ping 30.30.30.2 /vrf v1
```
``` 
pinging 30.30.30.2, src=null, vrf=v1, cnt=5, len=64, tim=1000, gap=0, ttl=255, tos=0, flow=0, fill=0, sweep=false, multi=false, detail=false
!!!!!
result=100%, recv/sent/lost/err=5/5/0/0, rtt min/avg/max/total=1/1/2/7
```

4. Connectivity test tunnel polka between  GVA0001 to RIO0001
``` console
GVA0001#ping 30.30.30.1 /vrf v1
```
```
pinging 30.30.30.1, src=null, vrf=v1, cnt=5, len=64, tim=1000, gap=0, ttl=255, tos=0, flow=0, fill=0, sweep=false, multi=false, detail=false
!!!!!
result=100%, recv/sent/lost/err=5/5/0/0, rtt min/avg/max/total=1/1/2/7
```


# Conclusion
In this article you:
- had a showcase on how to implement a fully disaggregated RARE/freeRtr
- you learned how to set up a PolKA environment deployment 

# References

https://ieeexplore.ieee.org/document/9165501

https://chalk-thought-7ce.notion.site/PolKA-Project-7452bbe9bd294a9b88791ba9650a7069

https://wiki.geant.org/

http://www.freertr.net/
