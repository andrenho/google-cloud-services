#!/bin/sh

. ../settings.sh

gcloud beta compute backend-buckets create static-bucket \
  --gcs-bucket-name $WEBSITE_BUCKET

gcloud beta compute backend-buckets create storage-bucket \
  --gcs-bucket-name $STORAGE_BUCKET

gcloud compute url-maps add-path-matcher web-map \
  --default-service $BACKEND_SERVICE \
  --path-matcher-name main-matcher \
  --backend-bucket-path-rules="/*=static-bucket,/storage/*=storage-bucket"
