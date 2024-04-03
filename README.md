# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa.

## Mongo

```bash
docker compose --env-file ./.env -f ./docker-compose-mongo.yml up -d
```

```bash
docker compose --env-file ./.env -f ./docker-compose-mongo.yml down
```

- **TODO:** Add mongo express file to check db in browser