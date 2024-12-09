# Tachyon

[![DockerHub Tachyon](https://img.shields.io/badge/DockerHub-buildscale%2Ftachylon-blue)](https://hub.docker.com/repository/docker/buildscale/tachyon)

http://www.alluxio.org/

Distributed in-memory filesystem for cluster computing frameworks, now called Alluxio (newer versions 1.0+ are found under buildscale/alluxio and the alluxio directory adjacent in this repo)

Starts one master and one worker and then tails the logs, maps the master and worker ports 19999 and 30000.

```
docker-compose up
```

or without `docker-compose`

```
make run
```

Related Docker images can be found for many Open Source, Big Data and NoSQL technologies on [my DockerHub profile](https://hub.docker.com/r/buildscale). The source for them all can be found in the [master Dockerfiles GitHub repo](https://github.com/BuildScale/Dockerfiles/).
