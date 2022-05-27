# gitops environment

This docker compose will setup and run
- redis
- mongodb
- timescaledb (postgres)

You will need `docker compose v2`. This should be available with the latest `docker`.

## Run

```
docker compose up -d
```

## View logs
```
docker compose logs -f
```

## Shutdown

```
docker compose down
```

# First time running setup

## mongodb

Need to setup replset for mongo

1. Watch logs to make sure its started
```
docker compose logs mongo1 -f
```

2. Install db extensions
```
docker compose exec mongo1 /scripts/setup-mongo-replset.sh
```

## timescaledb

Need to setup extra extensions for timescaledb (postgres)

1. Watch logs to make sure its started
```
docker compose logs timescaledb -f
```

2. Install db extensions
```
docker compose exec timescaledb /scripts/setup-timescaledb.sh
```
