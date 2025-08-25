#!/bin/bash

set -e 

url=$1;

status_code=$(curl -o /dev/null -s -w %{http_code} "$url")

if [[ $status_code -ge 200 && $status_code -lt 300 ]]; 
then
   echo "$status_code : Success"

elif [[ $status_code -ge 300 && $status_code -lt 400 ]]; 
then
   echo "$status_code : Redirect"

elif [[ $status_code -ge 400 && $status_code -lt 500 ]]; 
then
   echo "$status_code : Client Error"

else 
  echo "$status_code : Failure"
fi
