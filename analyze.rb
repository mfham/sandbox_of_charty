require 'csv'
require "charty"
require 'optparse'

opt = OptionParser.new
params = ARGV.getopts("i:")

raise StandardError, 'Please specify -i option' if params['i'].nil?

# advance preparations
h = Hash.new {|h, k| h[k] = 0 }
CSV.foreach("data/#{params['i']}", :headers => [:page_id, :yyyymm, :name]) do |row|
  h[row[:yyyymm]] += 1
end

x = []
y = []
h.keys.sort.each do |k|
  x << k
  y << h[k]
end

# charty
charty = Charty::Plotter.new(:pyplot)

bar = charty.bar do
  series x, y, label: "number"
  range x: x.min..x.max, y: 1..100
  xlabel 'year-month'
  ylabel 'num'
  title 'number of updating documents'
end
bar.render("images/sample.png")
