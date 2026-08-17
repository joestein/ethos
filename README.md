# ethos

## Development database

The dev/test database runs in Docker on port 54329 (host Postgres is broken
on this machine, so the app doesn't use the default 5432). Start it with
`docker compose up -d`, which brings up the `ethos-pg` container
(`postgres:16`, password `postgres`, named volume `ethos-pg-data`) matching
the connection settings in `config/dev.exs` and `config/test.exs`.
