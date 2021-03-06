#!/usr/bin/env ruby
#yxs1504
require 'csv'
require 'uri'
require 'pg'

#inserts data into Postgres db
uri = URI.parse('postgres://zhqqkzyehbvsah:1UtTG9XdHEvsaFFi602V2AKl63@ec2-107-21-219-235.compute-1.amazonaws.com:5432/dc72999lmnqk8')

begin 
    connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)    
    puts 'Successfully connected to Postgre db'
    puts "Processing CSV data"
    connection.exec("CREATE TABLE univs (UNITID integer, OPEID integer, opeid6 integer, 
INSTNM varchar(150), CITY varchar, STABBR varchar, INSTURL varchar(250),primary key (UNITID));")
    #Looping through csv to fetch and populate the db
    CSV.foreach('university.csv', :headers => true) do |csv_obj|
       connection.exec("INSERT into univs (UNITID, OPEID, opeid6, INSTNM, CITY,STABBR,INSTURL) VALUES ('"+csv_obj['UNITID']+"','"+csv_obj['OPEID']+"','"+csv_obj['opeid6']+"','"+csv_obj['INSTNM']+"','"+csv_obj['CITY']+"','"+csv_obj['STABBR']+"','"+csv_obj['INSTURL']+"');");
    end 
    puts "completed insertion sucessfully"
    connection.close
end



