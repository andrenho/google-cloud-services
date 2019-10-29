#!/bin/sh

. ../settings.sh

# bucket

gsutil mb -b on gs://$WEBSITE_BUCKET
gsutil iam ch allUsers:objectViewer gs://$WEBSITE_BUCKET
./deploy.sh

# load balancer rule

gcloud beta compute backend-buckets create static-bucket \
  --gcs-bucket-name $WEBSITE_BUCKET

gcloud compute url-maps add-path-matcher web-map \
  --default-service $BACKEND_SERVICE \
  --path-matcher-name bucket-matcher \
  --backend-bucket-path-rules="/website/*=static-bucket"

