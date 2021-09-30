# How to create a self-signed certificate

## Vagrant

```
vagrant up
vagrant ssh
sudo bash /vagrant/create-cert.sh
```

## Docker

```
docker run -it --rm --mount type=bind,source=$(pwd),target=/docker ubuntu
apt update
apt install openssl ca-certificates -y
bash /docker/create-cert.sh
```
