#!/bin/bash

PSQL="sudo -u postgres psql --dbname=periodic_table -t --no-align -c"

cat elements-data.csv | while IFS="," read ELEMENT SYMBOL ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
do
    if [[ $ELEMENT != "Element" ]]; then
        INSERT_ELEMENT_TABLE=$($PSQL "INSERT INTO elements (atomic_number, symbol, name) VALUES ($ATOMIC_NUMBER, '$SYMBOL', '$ELEMENT')");
        case $TYPE in
            "Nonmetal") TYPE_ID=1 ;;
            "Noble Gas") TYPE_ID=2 ;;
            "Alkali Metal") TYPE_ID=3 ;;
            "Alkaline Earth Metal") TYPE_ID=4 ;;
            "Metalloid") TYPE_ID=5 ;;
            "Halogen") TYPE_ID=6 ;;
            "Transition Metal") TYPE_ID=7 ;;
            "Post-transition Metal") TYPE_ID=8 ;;
            "Lanthanide") TYPE_ID=9 ;;
            "Actinide") TYPE_ID=10 ;;
        esac
        INSERT_PROPERTIES_TABLE=$($PSQL "INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES ($ATOMIC_NUMBER, $ATOMIC_MASS, '$MELTING_POINT', '$BOILING_POINT', $TYPE_ID);")
    fi
done