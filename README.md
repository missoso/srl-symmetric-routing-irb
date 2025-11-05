# SR Linux Symmetric routing scenario

Simple baseline setup to play with an Symmetric IRB setup, 4 leafs and only 2 of them used by default to ensure there are enough free nodes to add more clients

---

# Client baseline setup

![pic1](https://github.com/missoso/srl-symmetric-routing-irb/blob/main/img_and_drawio/srl-symmetric-routing-irb-detail.png)

# Overlay, underlay and mgmt 

![pic2](https://github.com/missoso/srl-asymmetric-routing-irb/blob/main/img_and_drawio/underlay_overlay_mgmt.drawio.png)

## Deploying the lab

The lab is deployed with the [containerlab](https://containerlab.dev) project, where [`symmetric.clab.yml`](https://github.com/missoso/srl-symmetric-routing-irb/blob/main/ssymmetric.clab.yml) file declaratively describes the lab topology.

```bash
# change into the cloned directory
# and execute
containerlab deploy --reconfigure
```

To remove the lab:

```bash
containerlab destroy --cleanup
```

## Access the lab

Leaf/spines: SSH through their management IP address or their hostname as defined in the topology file.

```bash
# reach a SR Linux leaf or a spine via SSH
ssh admin@leaf1
ssh admin@spine1
```
Linux clients cannot be reached via SSH, as it is not enabled, but it is possible to connect to them with a docker exec command.

```bash
# reach a Linux client via Docker
docker exec -it client1 bash
```

```bash
╭─────────┬────────────────────────────────────┬─────────┬────────────────╮
│   Name  │             Kind/Image             │  State  │ IPv4/6 Address │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ client1 │ linux                              │ running │ 172.80.80.31   │
│         │ ghcr.io/srl-labs/network-multitool │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ client2 │ linux                              │ running │ 172.80.80.32   │
│         │ ghcr.io/srl-labs/network-multitool │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ client3 │ linux                              │ running │ 172.80.80.33   │
│         │ ghcr.io/srl-labs/network-multitool │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ leaf1   │ nokia_srlinux                      │ running │ 172.80.80.11   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ leaf2   │ nokia_srlinux                      │ running │ 172.80.80.12   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ leaf3   │ nokia_srlinux                      │ running │ 172.80.80.13   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ leaf4   │ nokia_srlinux                      │ running │ 172.80.80.14   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ spine1  │ nokia_srlinux                      │ running │ 172.80.80.21   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
├─────────┼────────────────────────────────────┼─────────┼────────────────┤
│ spine2  │ nokia_srlinux                      │ running │ 172.80.80.22   │
│         │ ghcr.io/nokia/srlinux:24.10.1      │         │ N/A            │
╰─────────┴────────────────────────────────────┴─────────┴────────────────╯
```
