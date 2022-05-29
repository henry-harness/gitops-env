# gitops environment

This docker compose will setup and run
- redis
- mongodb
- timescaledb (postgres)
- mongo-express (optional)

You will need `docker compose v2`. This should be available with the latest `docker`.

## Run

```
docker compose up -d
```

Note: `-d` argument will start the pods in the background.

The pods are configured to have `restart: always`, which will restart the pods if the system gets shutdown.
To shutdown the pods, you must run the shutdown command explicitly.

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

Need to setup replset and admin user for mongo

1. Watch logs to make sure its started
```
docker compose logs mongo1 mongo2 mongo3 -f
```

2. Setup replica set
```
docker compose exec mongo1 /scripts/setup-mongo-replset.sh
```

3. Watch logs to make sure replset is completed. This could take a while (up to 30 seconds)
```
docker compose logs mongo1 mongo2 mongo3 -f
```

4. Setup admin user
```
docker compose exec mongo1 /scripts/setup-mongo-admin-user.sh
```

## monogo-express (optional)

1. Ensure mongo has been setup with replset and admin user.

2. Shutdown the pods

```
docker compose down
```

3. Then modify `docker-compose.yml` to uncomment the `mongo-express` section.

4. Start the pods again

```
docker compose up -d
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
