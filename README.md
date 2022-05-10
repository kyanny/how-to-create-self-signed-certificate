# How to create a self-signed certificate

## Vagrant

```
vagrant up
vagrant ssh
sudo bash /vagrant/create-certificate.sh
```

## Docker

```
docker run -it --rm --mount type=bind,source=$(pwd),target=/docker ubuntu
apt update
apt install openssl ca-certificates -y
bash /docker/create-certificate.sh
```

## Special thanks

- https://ma38su.hatenablog.com/entry/2020/06/27/235451
- https://kazuhira-r.hatenablog.com/entry/20180803/1533302929
- and some blog/stackoverflow posts
