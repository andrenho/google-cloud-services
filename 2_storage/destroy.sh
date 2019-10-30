#!/bin/sh

. ../settings.sh

gsutil rm gs://$STORAGE_BUCKET/**
gsutil rb gs://$STORAGE_BUCKET
