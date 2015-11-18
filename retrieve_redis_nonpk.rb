#!/usr/bin/env ruby
#yxs1504
require 'csv'
require 'redis'
require 'json'

begin 
    redisConn = Redis.new(:url => "redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119")
    puts 'Successfully connected to the Redis database'    
    puts "Enter the Key value (UNITID)"
    primary_key=gets.chomp
    query_val=redisConn.hgetall(primary_key)
    if unless query_val.nil? or query_val == 0  
	 puts "Retrieve success"   
 	 puts "the retrieved data for UNITID key :"+primary_key
	 puts " OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL"	
   	 puts "#{query_val['opeid']} | #{query_val['opeid6']} | #{query_val['instnm']} | #{query_val['city']} | #{query_val['stabbr']} | #{query_val['insturl']}"	     
    end
    end    
    redisConn.quit
    puts "Connection closed"
end

