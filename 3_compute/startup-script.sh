#!/bin/sh

echo "my IP address is $(hostname -I)" > ip
python -m SimpleHTTPServer 80
