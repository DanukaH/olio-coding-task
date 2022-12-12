# README

Summary
* Used Devise to implement registration and login.
* Please navigate to config/database.yml to set up your environment's user for mysql.
  * The 'oliouser' is there already so you need a user called 'oliouser' in mysql.
* Upon registration, the app will load the home page where users can see a button to navigate to view all Articles.
* In Articles, all the records will be pulled from the given server.
  * This server only allows GET requests, therefore the app can only pull info not write to it.
  * In this page, users can see a like button on every row, where they can like an Article only once.
  * Alternatively, users can click on any Article title to navigate to see more details. (more details can be added. 
  For the coding test purposes I have included Title, Description and like count) Here you can like the article as well.
  * However you can only like the Article, not unlike. (This will be an improvement I will try myself to do outside the coding test,
  as liking was the only requirement on the test)
* The article ID and the like count is persisted and updated in the database as it is not possible to write to the server.
  * Therefore the article infor will be pulled from the given server where as the like count will be pulled from the app DB.
* Lastly, the frontend is done with Bootstrap 5.