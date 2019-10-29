#!/bin/sh

. ../settings.sh

gcloud beta compute backend-buckets delete static-bucket -q

gcloud compute backend-services delete $BACKEND_SERVICE --global -q

gsutil rm gs://$WEBSITE_BUCKET/**
gsutil rb gs://$WEBSITE_BUCKET

