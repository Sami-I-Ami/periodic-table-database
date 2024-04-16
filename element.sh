#!/bin/bash

# variable to run PSQL
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if argument given
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
fi