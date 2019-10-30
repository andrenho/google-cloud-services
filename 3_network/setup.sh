#!/bin/sh

. ../settings.sh

# VPC

gcloud compute networks create $VPC_NAME --subnet-mode=custom

# subnets

gcloud compute networks subnets create public --network $VPC_NAME --range 10.0.1.0/24
gcloud compute networks subnets create private --network $VPC_NAME --range 10.0.2.0/24

# firewall rules

gcloud compute firewall-rules create allow-ssh \
  --direction=INGRESS \
  --priority=1000 \
  --network=$VPC_NAME \
  --action=ALLOW \
  --rules=tcp:22 \
  --source-ranges=0.0.0.0/0
