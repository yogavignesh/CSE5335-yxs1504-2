#!/usr/bin/env ruby

require 'csv'
require 'uri'
require 'pg'


uri = URI.parse('postgres://zhqqkzyehbvsah:1UtTG9XdHEvsaFFi602V2AKl63@ec2-107-21-219-235.compute-1.amazonaws.com:5432/dc72999lmnqk8')

begin 
    connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)    
    puts 'connected'
    #query= connection.exec("\\copy univs FROM '/home/yogambo/university.csv' DELIMITER ',' CSV HEADER;");
    CSV.foreach('university.csv', :headers => true) do |csv_obj|
       connection.exec("INSERT into univs (UNITID, OPEID, opeid6, INSTNM, CITY,STABBR,INSTURL) VALUES ('"+csv_obj['UNITID']+"','"+csv_obj['OPEID']+"','"+csv_obj['opeid6']+"','"+csv_obj['INSTNM']+"','"+csv_obj['CITY']+"','"+csv_obj['STABBR']+"','"+csv_obj['INSTURL']+"');");
    end 
    puts "completed insertion sucessfully"
    connection.close
end



