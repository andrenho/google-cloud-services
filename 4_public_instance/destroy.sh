#!/bin/sh

. ../settings.sh

gcloud compute instances delete $INSTANCE_NAME
gcloud compute firewall-rules delete allow-https
