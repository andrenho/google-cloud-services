#!/bin/sh

. ../settings.sh

# bucket

gsutil mb -b on gs://$WEBSITE_BUCKET
gsutil iam ch allUsers:objectViewer gs://$WEBSITE_BUCKET
./deploy.sh
gsutil web set -m index.html gs://$WEBSITE_BUCKET

# load balancer rule

