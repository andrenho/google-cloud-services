#!/bin/sh

. ../settings.sh

# DNS

IP=$(gcloud compute addresses describe lb-ip --format='get(address)' --global)

gcloud dns record-sets transaction start \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction remove $IP \
  --name=$DOMAIN. \
  --ttl=300 \
  --type=A \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction remove 0\ issue\ \"letsencrypt.org\" 0\ issue\ \"pki.goog\" \
  --name=$DOMAIN. \
  --ttl=300 \
  --type=CAA \
  --zone=$DNS_ZONE

gcloud dns record-sets transaction execute \
  --zone=$DNS_ZONE

# forwarding rules

gcloud compute forwarding-rules delete https-content-rule --global -q


# HTTPS proxy

gcloud compute target-https-proxies delete https-lb-proxy -q


# backend

gcloud compute health-checks delete http http-basic-check -q

gcloud compute url-maps delete web-map -q

gcloud compute url-maps remove-path-matcher web-map --path-matcher-name bucket-matcher -q

# certificate

gcloud beta compute ssl-certificates delete main --global -q
