#!/bin/bash
PSQL="sudo -u postgres psql --dbname=periodic_table -t --no-align -c"

echo -e "\nWelcome to the periodic table database"

TRY_AGAIN() {
  echo -e "\nWould you like info on another element (y/n)? "
  read AGAIN

  case $AGAIN in
  "y") GET_ELEMENT_INFO ;;
  "n") exit ;;
  *) TRY_AGAIN 
  esac
}

PRINT_DATA() {
  if [[ $BP_CELSIUS != "Unknown" ]]
  then
    echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP_CELSIUS celsius and a boiling point of $BP_CELSIUS celsius."
  elif [[ $MP_CELSIUS != "Unknown" ]]
  then
    echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP_CELSIUS celsius but its boiling point is still unknown."
  else
    echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. Its melting point and boiling point is still unknown."
  fi
}

GET_ELEMENT_INFO() {
  echo "Please enter an element (name, symbol or atomic number) to get its info:"
  read ELEMENT

  if [[ -z $ELEMENT ]]
  then
    echo "Please enter an element"
    GET_ELEMENT_INFO
    return
  fi

  unset ATOMIC_NUMBER SYMBOL NAME

  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$ELEMENT
  elif [[ $ELEMENT =~ ^[A-Z]$ || $ELEMENT =~ ^[A-Z][a-z]$ ]]
  then
    SYMBOL=$ELEMENT
  else
    NAME=$ELEMENT
  fi


if [ ! -z "${ATOMIC_NUMBER+x}" ]
then
  GET_DATA=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
  if [[ -z $GET_DATA ]]
  then
    echo I could not find that element in the database.
  else
    echo "$GET_DATA" | while IFS="|" read NAME SYMBOL TYPE ATOMIC_MASS MP_CELSIUS BP_CELSIUS
    do
      PRINT_DATA
    done
  fi
  
elif [ ! -z "${SYMBOL+x}" ]
then
  GET_DATA=$($PSQL "SELECT name, atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE symbol = '$SYMBOL';")
  if [[ -z $GET_DATA ]]
  then
    echo I could not find that element in the database.
  else
    echo "$GET_DATA" | while IFS="|" read NAME ATOMIC_NUMBER TYPE ATOMIC_MASS MP_CELSIUS BP_CELSIUS
    do
      PRINT_DATA
    done
  fi
elif [ ! -z "${NAME+x}" ]
then
  GET_DATA=$($PSQL "SELECT symbol, atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE name = '$NAME';")
  if [[ -z $GET_DATA ]]
  then
    echo I could not find that element in the database.
  else
    echo "$GET_DATA" | while IFS="|" read SYMBOL ATOMIC_NUMBER TYPE ATOMIC_MASS MP_CELSIUS BP_CELSIUS
    do
      PRINT_DATA
    done
  fi
fi
  TRY_AGAIN

}


GET_ELEMENT_INFO