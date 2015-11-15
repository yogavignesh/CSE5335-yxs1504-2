#!/usr/bin/env ruby
require 'mongo'

begin
	client = Mongo::Client.new([ 'ds053794.mongolab.com:53794' ],:database =>'heroku_sbddk600',:user=>'heroku_sbddk600',:password=>'qlc03tq84elf3uptbsr49i1fi2');
	puts "connected..."
        puts "Enter the non primary key value (a.Statecode or b.CITY)"
        opt=gets
   	q_key="Birmingham"
        col=:city   
	case opt.chomp
	when 'a'
	 col=:stabbr
	 puts "Enter the Statecode value:"
	 q_key=gets
	when 'b'
	 col=:city
	 puts "Enter the city value:"
	 q_key=gets
	else
	puts "Enter the correct non primary key" 
	end
	q_key=q_key.chomp
	db = client.database
        coll=db.collection('universities')	
        result=coll.find({ col =>q_key }).limit(20)
	if unless result.nil? or result == 0
		puts "The key results are :\n"    	    	
		result.each do |output|
		    puts "\n\nUNITID | OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL" 
		    puts "#{output['unitid']} | #{output['opeid']} | #{output['opeid6']} | #{output['instnm']} | #{output['city']} | #{output['stabbr']} |#{output['insturl']}"
		end    
	end
	end            	
        puts "Data retrieved for the non primary key"        

end



