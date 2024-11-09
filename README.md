# This is a database for the elements of the periodic table

## It contains the name, atomic number, symbol, atomic mass, type, melting point and boiling point of all elements

### if you want to use this yourself, follow these steps
1. Clone the repository
2. Make sure you have postgresql or any other database
3. Dump the periodic_table.sql file into your database
4. Alternatively, you can create your own database and tables and run insert_data.sh to insert everything from elements-data.csv. Refer to periodic_table.sql for the tables, keys, etc.
5. Run element.sh (make sure to make the appropriate changes to the PSQL variable first)
