#!/bin/bash

# check port
netstat -an | grep :8080 > /dev/null; if [ 0 != $? ]; then exit 1; fi;