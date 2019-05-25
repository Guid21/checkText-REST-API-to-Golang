#!/bin/bash

# # MacOS
# a=$(lsof -i :8080 | grep whoami | cut -d' ' -f '5'| sed s/[^0-9]//g)
# kill -9 $a
# node server.js

# Linux Ubuntu
a=$(netstat -tlnp | grep 8080 | cut -d'N' -f '2' | sed s/[^0-9]//g)
kill -9 $a
make re
./checkText