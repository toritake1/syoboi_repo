# coding: utf-8
require "csv"
require "pp"

year = ARGV[0]

csv_file= year.to_s + "_cast.csv"
array = Array.new
count = Hash.new(0)

CSV.foreach(csv_file) do |row|
    array.push(row[1])
end

array.each do |elem|
   count[elem] += 1
end 
 
CSV.open(year +'_cast_count.csv','w') do |cast|
   count.sort_by{ |_, v| -v }.each do |elm1, elm2|
      cast << [elm1.to_s,elm2.to_s]
   end
end

