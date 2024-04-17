#!/bin/bash

# variable to run PSQL
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if argument given
if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.

# check if argument is a number
elif [[ $1 =~ ^[0-9]+$ ]]
  then
    # get info from database
    ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number = $1")

    # if it doesn't exist
fi