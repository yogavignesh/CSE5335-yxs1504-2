#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'


#Inserts the csv data into the Redis database
begin 
    redisConn = Redis.new(:url => "redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119")
    puts 'Successfully connected to the Redis database'
    puts "Processing CSV data"
    CSV.foreach('university.csv', :headers => true) do |csv_obj|
      # redisConn.set csv_obj['UNITID'],[csv_obj['OPEID'],csv_obj['opeid6'],csv_obj['INSTNM'],csv_obj['CITY'],csv_obj['STABBR'],csv_obj['INSTURL']].to_json
      
      redisConn.hmset(csv_obj['UNITID'],:opeid, csv_obj['OPEID'],:opeid6, csv_obj['opeid6'],:instnm, csv_obj['INSTNM'],:city, csv_obj['CITY'],:stabbr, csv_obj['STABBR'],:insturl, csv_obj['INSTURL'])
    end 
    redisConn.quit
    puts "Inserted sucessfully"
    
end

