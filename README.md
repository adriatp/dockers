# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa

## todo

- [x] Add `mongo`
- [x] Add `mongo express`
- [x] Docs to run `mongo` without `mongo-express`
- [x] Use bash/make to `run` docker
- [x] Add `mariadb`
- [x] Add code version service like `gitlab` or `gitea`
- [x] Add `nginx` for dev apps
- [ ] Add `postfix` with (maybe) smtp relay
- [ ] Add `nginx` and `certbot` (watch out for arm)
- [ ] Add password manager like `passbolt`
- [ ] Add `minio` for storage
- [ ] rm `kill-all` function

## credentials

Copy sample creds and populate with your data

```bash
cp sample_creds/* credentials
```

## run

Make `run.sh` file executable and pass the operation and service

```bash
chmod +x run.sh
./run up mongo
```

### operations

- up
- down
- rm
- kill-all (deprecated)

### services

- mongo
- mongo-express
- mariadb
- gitea

## faqs

- **What if I can run docker due lack of permissions (like in Debian)?**

```bash
# Try to add your user into `docker` group. First create it (if it's not already)
cat /etc/group
sudo groupadd docker
# Add your user to the docker group
sudo usermod -aG docker ${USER}
# Reload session to re-evaluate the group membership
su -s ${USER}
```
