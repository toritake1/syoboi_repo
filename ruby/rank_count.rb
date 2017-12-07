# coding: utf-8
require "csv"
require "pp"

list_csv_file= Dir.glob("*/man.txt")
#list_csv_file= Dir.glob("*/woman.txt")

array = Array.new
count = Hash.new(0)

list_csv_file.each do |list|
   CSV.foreach(list) do |row|
       array.push(row[0])
   end
end

array.each do |elem|
   count[elem] += 1
end 
 
count.sort_by{ |_, v| -v }.each do |elm1, elm2|
      puts elm1.to_s + ',' + elm2.to_s
end

