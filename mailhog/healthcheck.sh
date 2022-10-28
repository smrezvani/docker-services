#!/bin/bash

# check port
netstat -an | grep :25 > /dev/null; if [ 0 != $? ]; then exit 1; fi;
netstat -an | grep :8025 > /dev/null; if [ 0 != $? ]; then exit 1; fi;
