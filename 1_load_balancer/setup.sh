#!/bin/sh

# see: https://cloud.google.com/load-balancing/images/https-load-balancer-diagram.svg

. ../settings.sh

# certificate

gcloud beta compute ssl-certificates create main \
  --domains $DOMAIN --global

# reserve IP address

gcloud compute addresses create lb-ip \
  --ip-version=IPV4 \
  --global

IP=$(gcloud compute addresses describe lb-ip --format='get(address)' --global)
echo "IP reserved: $IP"

# backend

gcloud compute health-checks create http http-basic-check \
  --port 80

gcloud compute backend-services create $BACKEND_SERVICE \
  --protocol HTTP \
  --health-checks http-basic-check \
  --global

gcloud compute url-maps create web-map \
  --default-service $BACKEND_SERVICE

# HTTPS proxy

gcloud compute target-https-proxies create https-lb-proxy \
  --url-map web-map \
  --ssl-certificates main

# forwarding rules

gcloud compute forwarding-rules create https-content-rule \
  --address=lb-ip \
  --global \
  --target-https-proxy=https-lb-proxy \
  --ports=443

# DNS rule

gcloud dns record-sets transaction start \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction add $IP \
  --name=$DOMAIN. \
  --ttl=300 \
  --type=A \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction add 0\ issue\ \"letsencrypt.org\" 0\ issue\ \"pki.goog\" \
  --name=$DOMAIN. \
  --ttl=300 \
  --type=CAA \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction execute \
  --zone=$DNS_ZONE
