## Obtaining ##

The Accumulo image can be obtained in one of at least two ways:
by pulling it from Docker Hub or building it using the provided Makefile.

### Pulling ###

To pull the image from Docker Hub, type:

```bash
docker pull jamesmcclain/accumulo:2
```

### Building ###

To build the image with the provided Makefile, type:

```bash
make
```

## Running the Leader ###

The leader contains a YARN Resource Manager, a Hadoop NameNode, and a MapReduce History Server, a ZooKeeper master, an Accumulo monitor, an Accumulo master, an Accumulo gc, an Accumulo tracer, an Accumulo tablet server, and everything in the follower described below.

To run the leader , type:

```bash
docker run -it --rm \
       -p 50095:50095 \
       --net=accumulo --hostname follower1 --name follower1 \
       --entrypoint /scripts/leader.sh \
       jamesmcclain/accumulo:2
```

There are lots of things in this one container.
The motivation for that is to sidestep the issue of how to coordinate the bringing-up of multiple containers in the correct sequence, while still allowing multi-node clusters to be possible using this image.
If splitting-up the functionality is desired, it is entirely possible to distribute the various parts across multiple containers; the provided scripts can be used as a guide.

## Running a Follower ###

The follower contains a YARN NodeManager, a Hadoop DataNode, and an Accumulo tablet server.
To run a follower, type:

```bash
docker network create --driver bridge accumulo
docker run -it --rm \
       --net=accumulo --hostname follower1 --name follower1 \
       --entrypoint /scripts/follower.sh
       jamesmcclain/accumulo:2
```

You should see that a new Hadoop node and a new Accumulo node have joined.
