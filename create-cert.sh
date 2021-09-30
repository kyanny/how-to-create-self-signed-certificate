#!/bin/bash
set -xe

# https://ma38su.hatenablog.com/entry/2020/06/27/235451
# https://kazuhira-r.hatenablog.com/entry/20180803/1533302929
# SAN
# *.example.local
# 127.0.0.1
echo "subjectAltName = DNS:*.example.local, DNS:example.local, IP:127.0.0.1" > san.txt
openssl genrsa -out sample.key 2048
openssl req -new -key sample.key -out sample.csr -subj "/CN=*.example.com"
openssl x509 -req -days 365 -in sample.csr -signkey sample.key -out sample.crt -extfile san.txt

# check
openssl x509 -text -in sample.crt --noout

cp sample.crt /etc/ssl/certs/sample.crt
update-ca-certificates
