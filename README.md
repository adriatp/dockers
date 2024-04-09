# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa

## todo

- [x] Add `mongo`
- [x] Add `mongo express`
- [x] Docs to run `mongo` without `mongo-express`
- [x] Use bash/make to run docker
- [ ] Add nginx and certbot (watch out for arm)
- [ ] Add `mariadb`
- [ ] Add `gitlab` or `gitea`
- [ ] Add `postfix` for smtp relay

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
- kill-all

### services

- mongo
- mongo-express

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
