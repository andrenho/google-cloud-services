#!/bin/sh

cd 0_basic
./destroy_security.sh
./destroy_dns.sh
cd ..

cd 1_website
./destroy.sh
cd ..
