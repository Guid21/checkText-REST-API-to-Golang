#!/bin/bash
a=$(netstat -tlnp | grep 8080 | cut -d'N' -f '2' | sed s/[^0-9]//g)
kill -9 $a
go build *.go
./handlers.checkText