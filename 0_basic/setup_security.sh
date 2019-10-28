#!/bin/sh

. ../settings.sh

gcloud iam service-accounts create $SERVICE_ACCOUNT --display-name $SERVICE_ACCOUNT

SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$SERVICE_ACCOUNT" --format="value(email)")

gcloud iam service-accounts keys create sa_secret.json --iam-account $SA_EMAIL
