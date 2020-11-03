# SimpleBlog App

Flatiron Sinatra Project Simple Blog WebApp
 
 a simple Blogging Application created to meet the MPV. 

## Installation

To use SimpleBlog App:

- fork and clone this repository.
- then on the Terminal run the following command:

          $ bundle install 

- Then run:

         $ rake db:migrate

-  to start the local server and run the app then run:
  
         $ shotgun

- them just go to `localhost:9393` on you web browser. 

## If Having issues Loading sinatra-flash gem and part of the layout Run: thin server

          $ bundle exec thin start --debug

- This command will use a Rack Adapter to start thin server --debug is optional but helpful if any error will be shown in the terminal. To to use the WebApp navigate to `localhost:3000`
 
 ## Contributing to this Project

 All kinds of contributions are welcome! The most basic way to show your support is to ⭐️ star the project, or to raise 🐞 issues Also feel fre to make a pull request.

 ## License

Simpleblog is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).