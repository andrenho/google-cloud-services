#!/bin/sh

. ../settings.sh

SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")

gcloud beta compute instances create $INSTANCE_NAME \
  --machine-type=f1-micro \
  --subnet=public \
  --network-tier=PREMIUM \
  --metadata-from-file startup-script=startup-script.sh \
  --maintenance-policy=MIGRATE \
  --service-account=$SA_EMAIL \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --tags=allow-https \
  --image=debian-9-stretch-v20191014 \
  --image-project=debian-cloud \
  --boot-disk-size=10GB \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=$INSTANCE_NAME \
  --reservation-affinity=any

#gcloud compute firewall-rules create allow-https \
#  --direction=INGRESS \
#  --priority=1000 \
#  --network=default \
#  --action=ALLOW \
#  --rules=tcp:443 \
#  --source-ranges=0.0.0.0/0 \
#  --target-tags=allow-https
