#!/bin/sh

mkdir /tmp/website
cd /tmp/website
echo "my IP address is $(hostname -I)" > ip
python3 -m http.server 80
