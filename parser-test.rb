require 'csv'
require 'smarter_csv'

input_string = File.read("test.tsv").force_encoding('MacRoman').encode('UTF-8')
none_string = input_string.gsub(/\"/, '')
data = CSV.parse(none_string, :col_sep => "\t")
puts data.length
p data

