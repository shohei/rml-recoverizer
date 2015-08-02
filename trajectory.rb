#encoding:utf-8

require 'pry'
require 'gnuplot'
require 'csv'
require 'pry'
include Math

array = []

pattern = /Z(?<x>0|-?[1-9]\d*),(?<y>0|-?[1-9]\d*),(?<z>0|-?[1-9]\d*);/
string = open("master.rml").read
string.split("\n").each do |str|
  if str.match(pattern)
    array.push([Regexp.last_match[:x],Regexp.last_match[:y],Regexp.last_match[:z]])
  end
end

# array.each do |coord|
#   x = coord[0]
#   y = coord[1]
#   z = coord[2]
#   print x,y,z
# end


hogearray = [
[1,2,3],
[1,3,4],
[5,3,2],
[5,5,2],
[5,7,2],
]

Gnuplot.open do |gp|
  Gnuplot::SPlot.new( gp ) do |plot|

    plot.title  "Array Plot Example"
    plot.xlabel "weight"
    plot.ylabel "price"


    # x = (0..50).collect { |v| v.to_f }
    # y = x.map{ |v| v ** 2 }


    # array.each do |coord|
      # x = coord[0]
      # y = coord[1]
      # z = coord[2]

      # plot.data << Gnuplot::DataSet.new( [x,y,z] ) do |ds|
      # plot.data << Gnuplot::DataSet.new( coord ) do |ds|
      # plot.data << Gnuplot::DataSet.new( array ) do |ds|
      plot.data << Gnuplot::DataSet.new( hogearray ) do |ds|
        # ds.with = "linespoints"
        ds.with = "points"
      end
      # sleep(2)
    # end

  end
end



