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

## FAQs

- **What if I can run docker due lack of permissions (like in Debian)?**

Try to add your user into `docker` group. First create it (if it's not already).

```bash
cat /etc/group
sudo groupadd docker
```

Add your user to the docker group

```bash
sudo usermod -aG docker ${USER}
```

Reload session to re-evaluate the group membership

```bash
su -s ${USER}
```

