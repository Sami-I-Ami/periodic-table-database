#!/bin/bash

# variable to run PSQL
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check if argument given
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.

# check if argument is a number
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # get info from database
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")

  # if it doesn't exist
  if [[ -z $ELEMENT_INFO ]]
  then
    echo I could not find that element in the database.
  
  else
    # read info
    echo "$ELEMENT_INFO" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
     echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

# check for symbol
elif  [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
  # get info from database
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")

  # if it doesn't exist
  if [[ -z $ELEMENT_INFO ]]
  then
    echo I could not find that element in the database.
  
  else
    # read info
    echo "$ELEMENT_INFO" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
     echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

# check for name
else
  # get info from database
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")

  # if it doesn't exist
  if [[ -z $ELEMENT_INFO ]]
  then
    echo I could not find that element in the database.
  
  else
    # read info
    echo "$ELEMENT_INFO" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
     echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi