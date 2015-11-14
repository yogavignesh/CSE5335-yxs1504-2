#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'



begin 
    redisConn = Redis.new(:url => "redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119")
    #redisConn = Redis.connect :url => ENV["redis://h:pbf731iss2eu3jaoojajbagnfs7@ec2-54-83-9-36.compute-1.amazonaws.com:18119"] 
    puts 'connected...'
    CSV.foreach('university.csv', :headers => true) do |csv_obj|
       redisConn.set csv_obj['UNITID'],[csv_obj['OPEID'],csv_obj['opeid6'],csv_obj['INSTNM'],csv_obj['CITY'],csv_obj['STABBR'],csv_obj['INSTURL']].to_json
    end 
    redisConn.quit
    puts "completed insertion sucessfully"
    
end

