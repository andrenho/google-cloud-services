#!/bin/sh

. ../settings.sh

gcloud iam service-accounts create $SERVICE_ACCOUNT --display-name $SERVICE_ACCOUNT

SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")
echo E-mail: $SA_EMAIL

gcloud iam service-accounts keys create sa_secret.json --iam-account $SA_EMAIL
