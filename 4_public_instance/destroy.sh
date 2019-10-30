#!/bin/sh

. ../settings.sh

gcloud compute instances delete $INSTANCE_NAME -q
