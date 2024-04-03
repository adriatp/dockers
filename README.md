# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa.

## TODO

- [x] Add `mongo`
- [ ] Add `mongo express`
- [ ] Add `mysql`
- [ ] Add nginx and certbot (watch out for arm)
- [ ] Add `gitlab` or `gitea`
- [ ] Add password manager

## Mongo

```bash
docker compose --env-file ./.env -f ./docker-compose-mongo.yml up -d
```

```bash
docker compose --env-file ./.env -f ./docker-compose-mongo.yml down
```