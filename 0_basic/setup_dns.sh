#!/bin/sh

. ../settings.sh

gcloud beta dns managed-zones create $DNS_ZONE --dns-name=$DOMAIN. --description=$DNS_ZONE
