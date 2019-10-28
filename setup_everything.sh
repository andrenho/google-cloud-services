#!/bin/sh

cd 0_basic
./setup_security.sh
./setup_dns.sh
cd ..

cd 1_website
./setup.sh
cd ..
