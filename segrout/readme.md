# Requirement

Basic Linux/Unix knowledge
Service provider networking knowledge

# Overview

FreeRouter is a free, open source router control plane software, freeRouter besides Ethernet, is able to handle HDLC, X25, frame-relay, ATM encapsulation. Since it handles packets itself at the socket layer, it is independent of underlying Operation System capabilities. The command line tries to mimic the industry standards with one exception:

Segment Routing for Source Routing in Network Fabrics.

In order to be able to start a topology with PolKa. 

# Article objective
This article exposes how to install freerouter and execute a core topology with Segment Routing.

- Operating system supported:
  - Debian 10 (stable aka buster)
  - Ubuntu 18.04 (Bionic beaver)
  - Ubuntu 20.04 (Focal fossa)

# Diagram

![freertr-Segrout](https://user-images.githubusercontent.com/56919528/162589959-f183642a-0914-4fd1-b92c-f966ecb37ca2.png)

# Troubleshooting

1. Display Routing Table IPV4

```console
R5#show ipv4 route v1
typ  prefix         metric  iface      hop      time
O    1.1.1.0/30     110/20  ethernet1  5.5.5.2  00:00:05
O    2.2.2.0/30     110/20  ethernet1  5.5.5.2  00:00:05
O    3.3.3.0/30     110/30  ethernet1  5.5.5.2  00:00:05
O    4.4.4.0/30     110/30  ethernet1  5.5.5.2  00:00:05
C    5.5.5.0/30     0/0     ethernet1  null     00:00:17
LOC  5.5.5.1/32     0/1     ethernet1  null     00:00:17
O    6.6.6.0/30     110/30  ethernet1  5.5.5.2  00:00:05
O    20.20.20.1/32  110/20  ethernet1  5.5.5.2  00:00:05
O    20.20.20.2/32  110/30  ethernet1  5.5.5.2  00:00:05
O    20.20.20.3/32  110/40  ethernet1  5.5.5.2  00:00:05
O    20.20.20.4/32  110/30  ethernet1  5.5.5.2  00:00:05
C    20.20.20.5/32  0/0     loopback0  null     00:00:19
O    20.20.20.6/32  110/40  ethernet1  5.5.5.2  00:00:02
C    30.30.30.0/30  0/0     tunnel1    null     00:00:15
LOC  30.30.30.1/32  0/1     tunnel1    null     00:00:15
```

2. Display Segment Routing Nodes

```console
R5#show ipv4 segrout v1
prefix         index  base    oldbase
20.20.20.1/32  1      352938  352938
20.20.20.2/32  2      352938  961971
20.20.20.3/32  3      352938  470248
20.20.20.4/32  4      352938  320727
20.20.20.6/32  6      352938  286439
```

3. Display Segment Routing Index

```console
R5#show ipv4 srindex v1
index  conn   prefix         peers  bytes
1      true   20.20.20.1/32  2 4 5  0
2      false  20.20.20.2/32  1 3 6  0
3      false  20.20.20.3/32  2 4    0
4      false  20.20.20.4/32  1 3    0
5      false  ::/0                  0
6      false  20.20.20.6/32  2      0
```

4. Ping Tunnel Segment Routing Over Ethernet

```console
R5#ping 30.30.30.2 /vrf v1
pinging 30.30.30.2, src=null, vrf=v1, cnt=5, len=64, tim=1000, gap=0, ttl=255, tos=0, sgt=0, flow=0, fill=0, sweep=false, multi=false, detail=false
!!!!!
result=100%, recv/sent/lost/err=5/5/0/0, rtt min/avg/max/sum=1/10/36/74, ttl min/avg/max=255/255/255, tos min/avg/max=0/0/0
```

5. Traceroute Tunnel Segment Routing Over Ethernet

```console
R5#traceroute 30.30.30.2 /vrf v1
tracing 30.30.30.2, src=null, vrf=v1, prt=0/33440, tim=1000, tos=0, flow=0, len=64
1 30.30.30.1 time=6
2 30.30.30.2 time=16, mpls=286445
```

6. Ping Over loopback interface R6

```console
R5#ping 20.20.20.6 /vrf v1 /interface l0
pinging 20.20.20.6, src=20.20.20.5, vrf=v1, cnt=5, len=64, tim=1000, gap=0, ttl=255, tos=0, sgt=0, flow=0, fill=0, sweep=false, multi=false, detail=false
!!!!!
result=100%, recv/sent/lost/err=5/5/0/0, rtt min/avg/max/sum=1/3/9/21, ttl min/avg/max=255/255/255, tos min/avg/max=0/0/0
```

7. Display tunnel 1

```console
R5#show running-config interface tunnel1
interface tunnel1
 no description
 tunnel vrf v1
 tunnel source loopback0
 tunnel destination 20.20.20.6
 tunnel mode sreth
 vrf forwarding v1
 ipv4 address 30.30.30.1 255.255.255.252
 no shutdown
 no log-link-change
 exit
```