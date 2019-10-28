#!/bin/sh

. ../settings.sh

SA_EMAIL=$(get_service_account)
KEY_ID=$(jq .private_key_id sa_secret.json -r)

gcloud -q iam service-accounts keys delete $KEY_ID --iam-account $SA_EMAIL

gcloud -q iam service-accounts delete $SA_EMAIL

rm sa_secret.json
