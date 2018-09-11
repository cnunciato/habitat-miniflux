# habitat-miniflux

A [Habitat](https://habitat.sh) plan for packaging and running [Miniflux](https://docs.miniflux.app), the open-source RSS server and feed reader.

## Overview

This plan packages and runs Miniflux 2 as a Habitat-managed service, and it also contains a `post-run` hook that takes care of creating the Miniflux database, creating its administrative user, and running its database migrations. Since [Miniflux 2 requires PostgreSQL](https://docs.miniflux.app/en/latest/opinionated.html#why-postgresql), the service also expects to be bound to a Habitat-managed PostgreSQL service  &mdash; so for example, if you wanted to run (as I usually do) Miniflux and PostgreSQL on the same machine, one way to do that would be:

```
# Start the Habitat Supervisor
hab sup run

# Install and start PostgreSQL
hab svc load core/postgresql

# Install and start Miniflux, binding it to PostgreSQL (and on start, run the database migrations)
hab svc load cnunciato/miniflux --bind db:postgresql.default
```

## Try It Out

If you'd just like to kick the tires on Miniflux, you can run this package as a Docker container (assuming you've got [Docker installed](https://store.docker.com/search?offering=community&type=edition), of course) by cloning this repository and running:

```
docker-compose up
```

In a few seconds, you should be able to browse to http://localhost and sign in with the default username and password:

* Username: admin
* Password: changeme

Add you some feeds, and be on your merry way!

## Get the Things

* Get the Miniflux Habitat package [on the Habitat Builder Depot](https://bldr.habitat.sh/#/pkgs/cnunciato/miniflux/latest)
* Get the Miniflux Docker container [on Docker Hub](https://hub.docker.com/r/cnunciato/miniflux/)


## Authors

* Chris Nunciato <chris@nunciato.org>
