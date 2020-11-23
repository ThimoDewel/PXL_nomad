#!/bin/sh 
# basic shell scipt 

UPDATES_COUNT=$(yum check-update --quiet | grep -v "^$" | wc -l)

  if [[ $UPDATES_COUNT -gt 0 ]]; then
    echo "Updates available: ${UPDATES_COUNT}" 
    echo "Updating.."
    yum update -y > /dev/null 2>&1
    echo "Updates done."
    echo "Updates available: ${UPDATES_COUNT}" 
  else
    echo "Geen updates beschikbaar"
  fi