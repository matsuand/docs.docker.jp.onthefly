%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use macvlan networks
description: All about using macvlan to make your containers appear like physical machines on the network
keywords: network, macvlan, standalone
redirect_from:
- /engine/userguide/networking/get-started-macvlan/
- /config/containers/macvlan/
---
@y
---
title: Use macvlan networks
description: All about using macvlan to make your containers appear like physical machines on the network
keywords: network, macvlan, standalone
redirect_from:
- /engine/userguide/networking/get-started-macvlan/
- /config/containers/macvlan/
---
@z

@x
Some applications, especially legacy applications or applications which monitor
network traffic, expect to be directly connected to the physical network. In
this type of situation, you can use the `macvlan` network driver to assign a MAC
address to each container's virtual network interface, making it appear to be
a physical network interface directly connected to the physical network. In this
case, you need to designate a physical interface on your Docker host to use for
the `macvlan`, as well as the subnet and gateway of the `macvlan`. You can even
isolate your `macvlan` networks using different physical network interfaces.
Keep the following things in mind:
@y
Some applications, especially legacy applications or applications which monitor
network traffic, expect to be directly connected to the physical network. In
this type of situation, you can use the `macvlan` network driver to assign a MAC
address to each container's virtual network interface, making it appear to be
a physical network interface directly connected to the physical network. In this
case, you need to designate a physical interface on your Docker host to use for
the `macvlan`, as well as the subnet and gateway of the `macvlan`. You can even
isolate your `macvlan` networks using different physical network interfaces.
Keep the following things in mind:
@z

@x
- It is very easy to unintentionally damage your network due to IP address
  exhaustion or to "VLAN spread", which is a situation in which you have an
  inappropriately large number of unique MAC addresses in your network.
@y
- It is very easy to unintentionally damage your network due to IP address
  exhaustion or to "VLAN spread", which is a situation in which you have an
  inappropriately large number of unique MAC addresses in your network.
@z

@x
- Your networking equipment needs to be able to handle "promiscuous mode",
  where one physical interface can be assigned multiple MAC addresses.
@y
- Your networking equipment needs to be able to handle "promiscuous mode",
  where one physical interface can be assigned multiple MAC addresses.
@z

@x
- If your application can work using a bridge (on a single Docker host) or
  overlay (to communicate across multiple Docker hosts), these solutions may be
  better in the long term.
@y
- If your application can work using a bridge (on a single Docker host) or
  overlay (to communicate across multiple Docker hosts), these solutions may be
  better in the long term.
@z

@x
## Create a macvlan network
@y
## Create a macvlan network
@z

@x
When you create a `macvlan` network, it can either be in bridge mode or 802.1q
trunk bridge mode.
@y
When you create a `macvlan` network, it can either be in bridge mode or 802.1q
trunk bridge mode.
@z

@x
- In bridge mode, `macvlan` traffic goes through a physical device on the host.
@y
- In bridge mode, `macvlan` traffic goes through a physical device on the host.
@z

@x
- In 802.1q trunk bridge mode, traffic goes through an 802.1q sub-interface
  which Docker creates on the fly. This allows you to control routing and
  filtering at a more granular level.
@y
- In 802.1q trunk bridge mode, traffic goes through an 802.1q sub-interface
  which Docker creates on the fly. This allows you to control routing and
  filtering at a more granular level.
@z

@x
### Bridge mode
@y
### Bridge mode
@z

@x
To create a `macvlan` network which bridges with a given physical network
interface, use `--driver macvlan` with the `docker network create` command. You
also need to specify the `parent`, which is the interface the traffic will
physically go through on the Docker host.
@y
To create a `macvlan` network which bridges with a given physical network
interface, use `--driver macvlan` with the `docker network create` command. You
also need to specify the `parent`, which is the interface the traffic will
physically go through on the Docker host.
@z

@x
```bash
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 pub_net
```
@y
```bash
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 pub_net
```
@z

@x
If you need to exclude IP addresses from being used in the `macvlan` network, such
as when a given IP address is already in use, use `--aux-addresses`:
@y
If you need to exclude IP addresses from being used in the `macvlan` network, such
as when a given IP address is already in use, use `--aux-addresses`:
@z

@x
```bash
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```
@y
```bash
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```
@z

@x
### 802.1q trunk bridge mode
@y
### 802.1q trunk bridge mode
@z

@x
If you specify a `parent` interface name with a dot included, such as `eth0.50`,
Docker interprets that as a sub-interface of `eth0` and creates the sub-interface
automatically.
@y
If you specify a `parent` interface name with a dot included, such as `eth0.50`,
Docker interprets that as a sub-interface of `eth0` and creates the sub-interface
automatically.
@z

@x
```bash
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 macvlan50
```
@y
```bash
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 macvlan50
```
@z

@x
### Use an ipvlan instead of macvlan
@y
### Use an ipvlan instead of macvlan
@z

@x
In the above example, you are still using a L3 bridge. You can use `ipvlan`
instead, and get an L2 bridge. Specify `-o ipvlan_mode=l2`.
@y
In the above example, you are still using a L3 bridge. You can use `ipvlan`
instead, and get an L2 bridge. Specify `-o ipvlan_mode=l2`.
@z

@x
```bash
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --subnet=192.168.212.0/24 \
    --gateway=192.168.210.254 \
    --gateway=192.168.212.254 \
     -o ipvlan_mode=l2 -o parent=eth0 ipvlan210
```
@y
```bash
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --subnet=192.168.212.0/24 \
    --gateway=192.168.210.254 \
    --gateway=192.168.212.254 \
     -o ipvlan_mode=l2 -o parent=eth0 ipvlan210
```
@z

@x
## Use IPv6
@y
## Use IPv6
@z

@x
If you have [configured the Docker daemon to allow IPv6](../config/daemon/ipv6.md),
you can use dual-stack IPv4/IPv6 `macvlan` networks.
@y
If you have [configured the Docker daemon to allow IPv6](../config/daemon/ipv6.md),
you can use dual-stack IPv4/IPv6 `macvlan` networks.
@z

@x
```bash
$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216
```
@y
```bash
$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Go through the [macvlan networking tutorial](network-tutorial-macvlan.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [host networking](host.md)
- Learn about [Macvlan networks](macvlan.md)
@y
- Go through the [macvlan networking tutorial](network-tutorial-macvlan.md)
- Learn about [networking from the container's point of view](../config/containers/container-networking.md)
- Learn about [bridge networks](bridge.md)
- Learn about [overlay networks](overlay.md)
- Learn about [host networking](host.md)
- Learn about [Macvlan networks](macvlan.md)
@z
