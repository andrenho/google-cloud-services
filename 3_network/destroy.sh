#!/bin/sh

. ../settings.sh

gcloud compute firewall-rules delete allow-ssh

gcloud compute networks subnets delete private --network $VPC_NAME
gcloud compute networks subnets delete public --network $VPC_NAME

gcloud compute networks delete $VPC_NAME

