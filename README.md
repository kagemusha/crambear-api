## Crambear Api

This project is the api side of a flash-card app.  The Ember-based companion client app is [here](https://github.com/kagemusha/crambear).

## Installation

(Assumes you have ruby installed)

After cloning the project, cd to the project's top-level dir and run:

         bundle install
         bundle exec rake db:create
         bundle exec rake db:migrate
         bundle exec rake db:seed
      
## Running the App

        bundle exec rails s
        
This will run the server on port `3000`.  The seeds create a user with email `t@t.com` and password `tester`.  

Go to the [client-app repo](https://github.com/kagemusha/crambear) for instructions on running the client.
