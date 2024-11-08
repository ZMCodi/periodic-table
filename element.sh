#!/bin/bash

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
  echo you are using atomic number $ATOMIC_NUMBER
elif [ -v SYMBOL ]
then
  echo you are using symbol $SYMBOL
else
  echo you are using name $NAME
fi