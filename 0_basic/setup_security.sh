#!/bin/sh

. ../settings.sh

gcloud iam service-accounts create $SERVICE_ACCOUNT --display-name $SERVICE_ACCOUNT

SA_EMAIL=$(get_service_account)
echo Service account e-mail: $SA_EMAIL

gcloud iam service-accounts keys create sa_secret.json --iam-account $SA_EMAIL
