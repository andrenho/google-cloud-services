#!/bin/sh

. ../settings.sh

gsutil rm gs://$WEBSITE_BUCKET/**
gsutil rb gs://$WEBSITE_BUCKET
