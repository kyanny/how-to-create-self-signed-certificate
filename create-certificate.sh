#!/bin/bash
set -e

hostname=$1
ipaddr=$2

if [[ -z $hostname ]]; then
  echo "Usage: $0 <hostname> [ipaddr]"
  exit 1
fi

# https://ma38su.hatenablog.com/entry/2020/06/27/235451
# https://kazuhira-r.hatenablog.com/entry/20180803/1533302929
# SAN
# *.example.local
# 127.0.0.1
if [[ -z $ipaddr ]]; then
  echo "subjectAltName = DNS:*.$hostname, DNS:$hostname" > san.txt
else
  echo "subjectAltName = DNS:*.$hostname, DNS:$hostname, IP:$ipaddr" > san.txt
fi
openssl genrsa -out $hostname.key 2048
openssl req -new -key $hostname.key -out $hostname.csr -subj "/CN=*.$hostname"
openssl x509 -req -days 365 -in $hostname.csr -signkey $hostname.key -out $hostname.crt -extfile san.txt

# check
openssl x509 -text -in $hostname.crt -noout

#cp $hostname.crt /etc/ssl/certs/$hostname.crt
#update-ca-certificates
