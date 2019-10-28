#!/bin/sh

. ../settings.sh

gsutil cp index.html google-cloud.jpg gs://$WEBSITE_BUCKET
