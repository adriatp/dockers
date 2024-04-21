# Dockers

Stores docker-compose files used in the past to keep tracking my pov soa

## todo

- [x] Add `mongo`
- [x] Add `mongo express`
- [x] Docs to run `mongo` without `mongo-express`
- [x] Use bash/make to `run` docker
- [x] Add `mariadb`
- [x] Add code version service like `gitlab` or `gitea`
- [x] Add `nginx` for dev apps (proxy)
- [ ] Add `postfix` with (maybe) smtp relay
- [ ] Add `nginx` and `certbot` (watch out for arm)
- [ ] Add password manager like `passbolt`
- [ ] Add `minio` for storage
- [ ] rm `kill-all` function

## install

```bash
# Install docker and docker-compose in arch-linux
sudo pacman -Sy docker docker-compose
sudo usermod -aG docker $USER
newgrp docker                         # or reboot
systemctl start docker
# systemctl enable docker
```

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
