# CSE-yxs1504-2
### yxs1504

TASK 6 : QUESTIONS
-----------


a. What is your external data source used to populate your Heroku data sources? 

    I chose the data from http://www.data.gov/developers/apis. 
    It is  a datasource about the universities in USA and their state information.
    Have chosen selective columns and top 300 records for the project.
    It is a csv file.
    
b. What are the Heroku toolbelt commands to execute the scripts? 

    The toolbelt run commands for the scripts are:
    ##Postgres
    $ heroku run ruby insert_csv_pg.rb
    $ heroku run ruby retrieve_pg.rb
    $ heroku run ruby retrieve_pg_nonpk.rb
    ##Mongo
    $ heroku run ruby insert_mongo.rb
    $ heroku run ruby retrieve_mongo.rb
    $ heroku run ruby retrieve_mongo_nonpk.rb
     ##Redis
    $ heroku run ruby insert_redis.rb
    $ heroku run ruby retrieve_redis.rb
    $ heroku run ruby retrieve_redis_nonpk.rb
    (For testing purpose the pk used was : 101189)

c. What aspect of the implementation did you find easy, if any, and why? 

    I found the task of inserting data in redis to be fast and easy as it was only a key value storage.
    Ruby has good support for all the three storage services.With just few lines of code i was able to achieve the requirement

d. What aspect of the implementation did you find hard, if any, and why? 

    I found the retrieval of redis using secondary index to be challenging.
    I also had some compatiblity issues with respect to ruby and mongo db.

# Uploading code to github:

     $ git init
     $ echo "# CSE5335-yxs1504-2" >> README.md
     $ git add README.md
     $ git commit -m "first commit"
     $ git remote add origin https://github.com/yogavignesh/CSE5335-yxs1504-2.git
     $ git push -u origin master 
     
    to update
     $ git remote add origin https://github.com/yogavignesh/CSE5335-yxs1504-2.git
     $ git push
    
    

# Getting code from github:

       $ heroku Login
       $ git clone https://github.com/yogavignesh/CSE5335-yxs1504-2.git
       $ cd CSE5335-yxs1504-2
       $ heroku create cse-yxs1504-2
       $ git push heroku master
       $ heroku open
       
### The link to the running heroku app

        https://cse-yxs1504-2.herokuapp.com/
        
### References

    http://redis.io/topics/indexes
    http://www.rubydoc.info/github/ezmobius/redis-rb/Redis%3Ahmset
    https://devcenter.heroku.com/articles/mongolab
    https://devcenter.heroku.com/articles/heroku-redis
    https://devcenter.heroku.com/articles/heroku-postgresql
    http://www.postgresql.org/docs/9.3/static/app-psql.html
    http://docs.mongolab.com/connecting/
    http://heroku.com
    http://stackoverflow.com/
        
