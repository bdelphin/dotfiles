#!/bin/bash

i=1
sp="/-\|"
echo -n ' '
while [ 1 ]
do
  echo "  ${sp:i++%${#sp}:1}  "
  sleep 0.1
done
