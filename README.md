# Week4_Project. Spending Tracker - Welcome to Spend@.

A simple application for tracking any payments you have made. The application is accessed via a web browser. A Ruby gem (Sinatra) is used as the web framework which sends and receives requests to a database on the user's machine.

## Getting Started.

Please pull all files into your required directory to begin. A database will be required to store user input. I used psql (information below) to create this on the command line:

```
createdb spending_app
```

When this has been created, run the following on the command line:

```
psql -d spending_app -f db/spend_app.sql
```

You should now have a database set up with the required columns. You can run the seeds document to populate the database with some data but this is not essential is more for illustration purposes.

```
ruby db/seeds.rb
```

From there, run the app.rb file to load a Sinatra server and input the suggested link in your browser, normally localhost:4567

```
ruby app.rb -> web browser -> localhost:4567
```

### Prerequisites

A number of ruby gems are required to run the files included. Minitest, PG, Sinatra, Pry and Sinatra Reloader have all been used in development of the app.

```
Minitest - https://rubygems.org/gems/minitest/versions/5.8.4
PG - https://rubygems.org/gems/pg/versions/0.18.4
Sinatra - https://github.com/sinatra/sinatra
Pry - https://github.com/pry/pry
Sinatra Reloader - http://sinatrarb.com/contrib/reloader
```

## Running the tests

Basic tests are present within the models/specs file. These can be run from the command line as long as the minitest gem is installed. Be sure to replace [test] with the required file and run the following command:

```
ruby specs/[test].rb
```

These tests are present to ensure the models in the specs file are completing their required functions.

## Built With

* [Ruby] http://ruby-doc.com/ - A dynamic, interpreted, reflective, object-oriented, general-purpose programming language.
* [Sinatra] http://sinatrarb.com/ - Web framework
* [atom] https://atom.io/ - Code editor
* [PostgreSQL] https://www.postgresql.org/ - Open source object-relational database management system.
* [Postico] https://eggerapps.at/postico/ - A Modern PostgreSQL Client for the Mac
* [draw.io] https://www.draw.io/ There are two .xml files in the 'misc' folder. These are diagrams which can be opened @ draw.io and show my initial class and database modelling process.

## Contributing

This is the first project I have completed where I used Sinatra and linking it to a database. If you have any suggestions or improvements, please email me @ james.jardine@gmx.com. If you would like to download the included code and make any changes, please go ahead :)

## Authors

Most work completed by myself, https://github.com/jjardine85


## Acknowledgments

Most work, but not all work was completed by myself. Notable mentions and enormous thanks to my tutors @ CodeClan Edinburgh (https://github.com/orgs/codeclan / https://codeclan.com/), Keith Douglas (https://github.com/keithdhd) and Colin Farquhar (https://github.com/cifarquhar). Honourable mentions go to my learning buddies for various pieces of knowledge at various times, not just with this project but with my entire learning journey;

Cassia - https://github.com/cass3836
Chris - https://github.com/chrishontoir
Conor - https://github.com/cwilson0005
Dave - https://github.com/davejmacm
Jennifer - https://github.com/JenniferMariyadas
Stephen - https://github.com/srafferty73
Tom - https://github.com/tomclyde
