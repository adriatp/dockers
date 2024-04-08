# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa.

## TODO

- [x] Add `mongo`
- [x] Add `mongo express`
- [ ] Add nginx and certbot (watch out for arm)
- [ ] Add `mariadb`
- [ ] Add `gitlab` or `gitea`
- [ ] Add password manager
- [ ] Docs to run `mongo` without `mongo-express`
- [ ] Use bash/make to run docker

## Mongo

```bash
docker compose -f ./docker-compose-mongo.yml --env-file ./credentials/mongo.env --env-file ./credentials/mongo-express.env up -d
```

```bash
docker compose -f ./docker-compose-mongo.yml down
```

## Nginx

`TODO`

## MariaDB

`TODO`

## Git repo

`TODO`

## Clean Docker (**Warning**)

Only use in dev/test, **this removes all images, containers, and volumes**

```bash
docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker rmi -f $(docker images -a -q); docker volume rm -f $(docker volume ls -q)
```

## FAQs

- **I just cloned this repo, what should I do?**

1. Copy the contents of the `sample_creds` folder to `credentials` and change the values to your needs

2. Run the `up` docker-compose command of the services you want to run

3. Enjoy 😎

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

