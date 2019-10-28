#!/bin/sh

. ../settings.sh

gcloud beta compute ssl-certificates create main \
  --domains $DOMAIN --global

gcloud beta compute backend-buckets create static-bucket \
  --gcs-bucket-name $WEBSITE_BUCKET

gcloud compute health-checks create http http-basic-check \
  --port 80

gcloud compute backend-services create web-backend-service \
  --protocol HTTP \
  --health-checks http-basic-check \
  --global

gcloud compute url-maps create web-map \
  --default-service web-backend-service

gcloud compute url-maps add-path-matcher web-map \
  --default-service web-backend-service \
  --path-matcher-name bucket-matcher \
  --backend-bucket-path-rules="/website=static-bucket"
