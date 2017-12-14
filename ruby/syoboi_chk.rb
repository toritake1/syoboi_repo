# coding: utf-8
require 'open-uri'
require 'kconv'
require 'rexml/document'
require 'active_support'
require 'active_support/core_ext'
require "csv"

#year = ARGV[0]
#csv_file= year + ".csv"

url  = 'http://cal.syoboi.jp/cal_chk.php'
xml  = open( url ).read.toutf8
doc = REXML::Document.new(xml)
xmlhash = Hash.from_xml(doc.to_s)

chlist = []
xmlhash.dig("syobocal","ProgItems","ProgItem").each do | item|
   chlist.push(item.dig("ChName"))
end

count = Hash.new(0)
chlist.each do |elem|
  count[elem] += 1
end

count.sort_by{ |_, v| -v }.each{ |k,v|
   puts k + "\t" + v.to_s
}

