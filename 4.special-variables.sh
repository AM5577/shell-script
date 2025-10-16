#!/bin/bash
echo "All variables passed: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "directory of current user $USER"
echo "process id of curent script $$"
sleep 60 &
echo "process id of background script $!"