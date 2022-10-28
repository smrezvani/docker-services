#!/bin/bash

# check port
netstat -an | grep :80 > /dev/null; if [ 0 != $? ]; then exit 1; fi;