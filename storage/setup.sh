#!/bin/sh

. ../settings.sh

gsutil mb -b on gs://$STORAGE_BUCKET
gsutil iam ch allUsers:objectViewer gs://$STORAGE_BUCKET
gsutil cp status gs://$STORAGE_BUCKET
gsutil cors set cors.json gs://$STORAGE_BUCKET
