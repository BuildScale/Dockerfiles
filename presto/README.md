# Teradata's distribution of Presto SQL DB (by Facebook)

[![DockerHub Presto](https://img.shields.io/badge/DockerHub-buildscale%2Fpresto-blue)](https://hub.docker.com/repository/docker/buildscale/presto)

http://www.teradata.com/products-and-services/Presto/Presto-Download

Teradata's distribution of Presto DB - the distributed interactive high scale SQL engine for Big Data.

Includes the ODBC and JDBC drivers for Presto.

For all the Facebook Presto releases see the adjacent `presto-dev` directory.

Starts a single Presto node which acts as both coordinator and worker and maps port 8080 for nice web UI and driver access.

If started interactively will drop in to a SQL shell.

```
docker-compose up
```

or without `docker-compose`

```
make run
```

Related Docker images can be found for many Open Source, Big Data and NoSQL technologies on [my DockerHub profile](https://hub.docker.com/r/buildscale). The source for them all can be found in the [master Dockerfiles GitHub repo](https://github.com/BuildScale/Dockerfiles/).
