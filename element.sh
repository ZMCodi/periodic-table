#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$1
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$ELEMENT
  elif [[ $ELEMENT =~ ^[A-Z]$ || $ELEMENT =~ ^[A-Z][a-z]$ ]]
  then
    SYMBOL=$ELEMENT
  else
    NAME=$ELEMENT
  fi
fi

if [ -v ATOMIC_NUMBER ]
then
  GET_DATA=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING (atomic_number) WHERE atomic_number = $ATOMIC_NUMBER;")
  echo "$GET_DATA" | while IFS="|" read NAME SYMBOL TYPE ATOMIC_MASS MP_CELSIUS BP_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP_CELSIUS celsius and a boiling point of $BP_CELSIUS celsius."
  done
elif [ -v SYMBOL ]
then
  echo you are using symbol $SYMBOL
elif [-v NAME ]
then
  echo you are using name $NAME
fi