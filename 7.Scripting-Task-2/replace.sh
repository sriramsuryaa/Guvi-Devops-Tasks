#!/bin/bash

set -e

content="./content.txt"
output="./replaced-content.txt"


function replace_as_new_file()
{
  sed '1,4b; /welcome/ s/give/learning/g' $content > $output

   if [ -f replaced-content.txt ]; 
     then
       echo "Replaced file : replaced-content.txt"
     fi
}

function replace_in_actual_file()
{
  sed -i '1,4b; /welcome/ s/give/learning/g' $content
}

replace_as_new_file

