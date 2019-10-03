## Pokemon Sumo CRUD Application

For this project we built a Command Line CRUD (Create, Read, Update, Delete) App that uses a database to persist information and it was built with and using all the following:
- Ruby
- Object Orientation
- Relationships (via ActiveRecord)
- Use of the Command Line Interface (CLI)


Our Pokemon Sumo project has three models with corresponding tables, has access to a Sqlite3 database using ActiveRecord, has a CLI that allows users to interact with the database, and incorporates a Pokemon API available to us online called PokeAPI https://pokeapi.co/.  

This Command Line CRUD application is analogous to the well known and popular set of Pokemon video games released in the 90's that won the hearts of many all over the world. Pokemon Sumo is designed to take the user directly into the world of Pokemon and assigns a user a Pokemon that will then be used to train, level up, acquire new Pokemon and ultimately battle 3 ominous foes who get progressively difficult to beat as the game goes on. The winner of any match is decided by the weight of your Pokemon, hence 'sumo'.  

## Prerequisites
To run this application you will want to make sure that you run bundle install in your terminal.

``` bundle install```

Once you have this completed you will want to run db:migrate to ensure that your database is update to date with the tables and models in this project. 

```db:migrate```

## Running the Application 

Once you have all that set up you will now be able to enter into the world of Pokemon and begin playing. To play the game you will want to enter the Command Line Interace by typing the following in your terminal: 

```ruby bin/run.rb ```


Then you can either start a new game or continue a game like so: 

(gif)

At this point, if you enter 1 you will be assigned your very own pokemon to start your game off. 


You will now be taken to a menu with 5 options like so and have a chance to train in order to level up (leveling up adds weight to your current Pokemon) and have new Pokemon added to your team, view the current Pokemon on your team along with their weight, battle a boss (3 total), restart your game, be able to give a Pokemon a nickname, and finally close the game. 

Here is what happens when you train. 

gif showing adding weight
gif showing adding pokemon to team.

Here is what happens when you battle a boss. 

gif showing battling boss

## Conclusion

Congratulations, you have entered the world of Pokemon and competed against other Pokemon and bosses by weight. Most importantly, you were able to see how Ruby, object orientation, ActiveRecord, API's, and the use of a database could all be used to play a game that models a real life Nintendo video game.  


