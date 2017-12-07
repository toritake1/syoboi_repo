# coding: utf-8
require "syoboi_calendar"
require "pp"
require "csv"

year = ARGV[0]

csv_file= year + ".csv"
client = SyoboiCalendar::Client.new

CSV.open(year +'_cast.csv','w') do |cast|
   CSV.foreach(csv_file) do |row|
      title = client.list_titles(title_id: row[2]).first 
      title.casts.each do |n|
          cast << [title.name.to_s,n.name.to_s]
      end   
   sleep 1
   end
end
