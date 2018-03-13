# Scheduling-app

This is a simple scheduling application which clients can use to schedule appointments with users


The app is deployed on Heroku: https://time-place.herokuapp.com/


The source code is here on GitHub: https://github.com/hoffyboy/scheduling-app


# Setup and Configuration

  **Languages and Frameworks:** Ruby on Rails and Bootstrap


  **Ruby version:** 2.4.1


  **Databases:** SQLite (Test, Development), PostgreSQL (Production)


  **Development Tools and Gems include:**

  + IceCube for creation of recurrence rules
  + ActsAsBookable to allow resources to be booked by users


  **To run Driven locally:**
  + Clone the repository
  + Run bundle install
  + Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
  + Start the server using `rails server`
  + Run the app on `localhost:3000`
