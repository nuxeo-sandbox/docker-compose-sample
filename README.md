# Docker Compose sample with Nuxeo

## Launching on a default Docker instance

This is a sample [Docker Compose](https://docs.docker.com/compose/) definition that allow to start a multi-tier application based on Nuxeo.

Given you have a `default` docker machine, run it by launching :

```console
eval $(docker-machine env default)
docker-compose --x-networking [--x-network-driver=overlay] up -d
```

You can then access your application at  [http://$(docker-machine ip default):8080/nuxeo/]()
    
Notice : This require experimental [Docker Compose network support](https://docs.docker.com/compose/networking/).

## Launching on Swarm

You can also launch that application on a Swarm cluster. To setup the cluster, you can launch the `setup-swarm.sh` shell that will create three Swarm Docker machines and launch Docker Compose on top of it.

You may adjust the script so that it fits you computer capabilites. 

## About Nuxeo

Nuxeo dramatically improves how content-based applications are built, managed and deployed, making customers more agile, innovative and successful. Nuxeo provides a next generation, enterprise ready platform for building traditional and cutting-edge content oriented applications. Combining a powerful application development environment with SaaS-based tools and a modular architecture, the Nuxeo Platform and Products provide clear business value to some of the most recognizable brands including Verizon, Electronic Arts, Netflix, Sharp, FICO, the U.S. Navy, and Boeing. Nuxeo is headquartered in New York and Paris. More information is available at [www.nuxeo.com](http://www.nuxeo.com/).