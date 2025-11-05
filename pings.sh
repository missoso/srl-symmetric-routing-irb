#!/bin/bash

# quick pings to populate the arp table

echo "pings from client 1 to 2 and 3"
docker exec client1 ping -c 2 172.17.2.2
docker exec client1 ping -c 2 172.17.1.3

echo "pings from client 2 to 1 and 3"
docker exec client2 ping -c 2 172.17.1.1
docker exec client2 ping -c 2 172.17.1.3

echo "pings from client 3 to 1 and 2"
docker exec client3 ping -c 2 172.17.2.2
docker exec client3 ping -c 2 172.17.1.1
