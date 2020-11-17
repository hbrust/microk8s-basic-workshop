#!/bin/bash
# generate hotdrink cert
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout hotdrink.key -out hotdrink.crt -subj "/C=DE/CN=*.beverages.demo"
echo "
apiVersion: v1
data:
  tls.crt: $(base64 hotdrink.crt | tr -d '\n')
  tls.key: $(base64 hotdrink.key | tr -d '\n')
kind: Secret
metadata:
  name: hotdrink-secret
  namespace: team-hotdrink
type: kubernetes.io/tls
" > ../coffeeshop/05_hotdrink-secret.yml


# generate colddrink cert
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout colddrink.key -out colddrink.crt  -subj "/C=DE/CN=*.beverages.demo"
echo "
apiVersion: v1
data:
  tls.crt: $(base64 colddrink.crt | tr -d '\n')
  tls.key: $(base64 colddrink.key | tr -d '\n')
kind: Secret
metadata:
  name: colddrink-secret
  namespace: team-colddrink
type: kubernetes.io/tls
" > ../coffeeshop/07_colddrink-secret.yml

# generate cert for dashboards
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout dashboards.key -out dashboards.crt  -subj "/C=DE/CN=*.mk8s-demohost.demo"
echo "
apiVersion: v1
data:
  tls.crt: $(base64 dashboards.crt | tr -d '\n')
  tls.key: $(base64 dashboards.key | tr -d '\n')
kind: Secret
metadata:
  name: dashboards-secret
  namespace: monitoring
type: kubernetes.io/tls
" > ../system-dashboards/dasboards-secret.yml

