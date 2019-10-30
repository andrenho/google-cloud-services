#!/bin/sh

gcloud compute url-maps remove-path-matcher web-map --path-matcher-name main-matcher -q

gcloud beta compute backend-buckets delete storage-bucket -q

gcloud beta compute backend-buckets delete static-bucket -q
