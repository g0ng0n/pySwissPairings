# Project: Tournament Results

## Description
    In this project is a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.
    The module will use the Swiss system for pairing up players in each round: 
    players are not eliminated, each player should be paired with another player with the same number of wins, or as close as possible.
    This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.


## Understand the purpose of each file
 * tournament.sql  - this file is used to set up your database schema (the table representation of your data structure).
 * tournament.py - this file is used to provide access to your database via a library of functions which can add, delete or query data in your database to another python program (a client program). Remember that when you define a function, it does not execute, it simply means the function is defined to run a specific set of instructions when called.
 * tournament_test.py - this is a client program which will use your functions written in the tournament.py module. We've written this client program to test your implementation of functions in tournament.py


## Running the project!
 * Prerequisities: python2.7, PostgreSQL(psql (9.3.13)
 * In order to create the schema in PostgreSQL, you need to:
 	* 1- enter in the postgresql db using the command psql using the terminal
 		$ psql
 	* 2- once inside, import the sql script using the command \i [nameOfTheScript.sql]
 		$ vagrant=> \i tournament.sql
 * To run the series of tests defined in this test suite, run the program from the command line 
    $ python tournament_test.py 




