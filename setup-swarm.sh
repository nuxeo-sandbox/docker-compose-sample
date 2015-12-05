#!/bin/bash


docker $(docker-machine config default) run -d \
    -p "8500:8500" \
    -h "consul" \
    progrium/consul -server -bootstrap
sleep 10

docker-machine create \
    -d virtualbox \
    --virtualbox-disk-size 50000 \
    --virtualbox-cpu-count 3 \
    --virtualbox-memory 3072 \
    --swarm \
    --swarm-master \
    --swarm-discovery="consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-store=consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-advertise=eth1:0" \
    swarm-master

sleep 10
docker-machine create \
    -d virtualbox \
    --virtualbox-disk-size 50000 \
    --virtualbox-cpu-count 3 \
    --virtualbox-memory 3072 \
    --swarm \
    --swarm-discovery="consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-store=consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-advertise=eth1:0" \
    swarm-agent-00

sleep 10
docker-machine create \
    -d virtualbox \
    --virtualbox-disk-size 50000 \
    --virtualbox-cpu-count 3 \
    --virtualbox-memory 3072 \
    --swarm \
    --swarm-discovery="consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-store=consul://$(docker-machine ip default):8500" \
    --engine-opt="cluster-advertise=eth1:0" \
    swarm-agent-01

sleep 10
eval $(docker-machine env --swarm swarm-master)
docker-compose --x-networking --x-network-driver=overlay up -d
