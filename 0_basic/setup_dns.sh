#!/bin/sh

. ../settings.sh

gcloud beta dns managed-zones create learn-gcp --dns-name=$DOMAIN. --description=learn-gcp 
