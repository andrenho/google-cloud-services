#!/bin/sh

. ../settings.sh

gsutil mb -b on gs://$WEBSITE_BUCKET
gsutil iam ch allUsers:objectViewer gs://$WEBSITE_BUCKET
./deploy.sh
