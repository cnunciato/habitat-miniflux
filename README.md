# miniflux

## Description

[Miniflux](https://docs.miniflux.app) is an open-source RSS server and feed reader.

## Usage

This plan packages and runs Miniflux 2 as a Habitat-managed service, and it also contains a `post-run` hook that takes care of creating the Miniflux database, creating its administrative user, and running its database migrations. Since [Miniflux 2 requires PostgreSQL](https://docs.miniflux.app/en/latest/opinionated.html#why-postgresql), the service also expects to be bound to a Habitat-managed PostgreSQL service  &mdash; so for example, if you wanted to run (as I usually do) Miniflux and PostgreSQL on the same machine, one way to do that would be:

```
# Start the Habitat Supervisor
hab sup run

# Install and start PostgreSQL
hab svc load core/postgresql

# Install and start Miniflux, binding it to PostgreSQL (and on start, run the database migrations)
hab svc load cnunciato/miniflux --bind db:postgresql.default
```

## Why the core/postgresql dependency?

As of this writing, since the Miniflux CLI doesn't provide a subcommand for creating its own database, a runtime dependency on `core/postgresal` is declared in order to make use of the PostgreSQL `createdb` command, which we run when the Miniflux service starts &mdash; perhaps not ideal, but it does get the job done, and seems reasonable given Miniflux's dependency on PostgreSQL. This particular implementation detail may change in a future release, but you should expect the Miniflux service to continue managing its own database needs going forward.
