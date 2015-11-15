#!/usr/bin/env ruby
require 'mongo'

begin
	client = Mongo::Client.new([ 'ds053794.mongolab.com:53794' ],:database =>'heroku_sbddk600',:user=>'heroku_sbddk600',:password=>'qlc03tq84elf3uptbsr49i1fi2');
	puts "connected..."
        puts "Enter the primary key (UNITID is used as primary key)"
        primary_key=gets
        if primary_key.strip! == nil
            pKey=primary_key
        else
            pKey=primary_key
        end
	db = client.database
        coll=db.collection('universities')	
        result=coll.find({ :unitid =>pKey })
	if unless result.nil? or result == 0
		puts "The key results are :\n"    	    	
		result.each do |output|
		    puts "\n\nUNITID | OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL" 
		    puts "#{output['unitid']} | #{output['opeid']} | #{output['opeid6']} | #{output['instnm']} | #{output['city']} | #{output['stabbr']} |#{output['insturl']}"
		end    
	end
	end            	
        puts "data retrieved"        

end



