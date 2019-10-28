#!/bin/sh

. ../settings.sh

SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")
KEY_ID=$(jq .private_key_id sa_secret.json -r)

gcloud -q iam service-accounts keys delete $KEY_ID --iam-account $SA_EMAIL

gcloud -q iam service-accounts delete $SA_EMAIL

rm sa_secret.json
