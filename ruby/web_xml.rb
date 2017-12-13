# coding: utf-8
require 'open-uri'
require 'kconv'
require 'rexml/document'
require 'active_support'
require 'active_support/core_ext'
require "csv"

year = ARGV[0]

csv_file= year + ".csv"

CSV.foreach(csv_file) do |row|
   url  = 'http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=' + row[2]
   xml  = open( url ).read.toutf8
   doc = REXML::Document.new(xml)
   xmlhash = Hash.from_xml(doc.to_s)

   File.open("comment.txt", "w") do |f| 
      f.puts(xmlhash.dig("TitleLookupResponse","TitleItems","TitleItem","Comment"))
   end

   commentlist=[]
   File.open("comment.txt","r") do |io|
      io.each do |line|
         commentlist.push(line)
      end
   end

   commentlist.grep(/歌:/).each do |s|
       puts s
#      puts s.split(":").last
   end

   File.delete "comment.txt"
   sleep 1
end

