#!/usr/bin/env ruby
#yxs1504
require 'mongo'
require 'csv'

#insert data into mongo db collection
begin
	coll_NAME='universities'
	client = Mongo::Client.new([ 'ds053794.mongolab.com:53794' ],:database =>'heroku_sbddk600',:user=>'heroku_sbddk600',:password=>'qlc03tq84elf3uptbsr49i1fi2');
	puts "Sucessfully connected to Mongo Lab..."
        puts "Processing CSV data"
	db = client.database
        coll=db.collection(coll_NAME)
	#Looping through csv to fetch and populate the db(using hmset)
	CSV.foreach('university.csv', :headers => true) do |csv_obj|
               result=coll.insert_one({ :unitid => csv_obj['UNITID'], :opeid => csv_obj['OPEID'], :opeid6 => csv_obj['opeid6'], :instnm => csv_obj['INSTNM'], :city => csv_obj['CITY'], :stabbr => csv_obj['STABBR'], :insturl => csv_obj['INSTURL']})         
                
        end 	
        puts "insertion done"

end



