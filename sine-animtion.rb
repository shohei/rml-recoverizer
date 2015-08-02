require 'gnuplot'
require 'csv'
require 'pry'
include Math

Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|

    plot.title  "Array Plot Example"
    plot.xlabel "weight"
    plot.ylabel "price"

    # table = CSV.table('contents.csv')
    f = 1 #[Hz]
    omega = (f*1.0)/(2*PI)

    # x = (0..50).collect { |v| v.to_f }
    # x = (0..10).step(0.01).to_a#.map(&:to_f)
    # y = x.map{ |v| v ** 2 }
    # t = 0
    # y = x.map{ |v| sin(v-omega*t)}
    # x = table[:weight]
    # y = table[:price]

    # save_image_string = <<-EOS
    #   set terminal pdf
    #   set output "graph.pdf"
    # EOS
    # plot.arbitrary_lines << save_image_string

    (0..10).to_a.each do |t|
      x = (0..10).step(0.01).to_a#.map(&:to_f)
      y = x.map{ |v| sin(v-omega*t)}
      plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
        # ds.with = "linespoints"
        ds.with = "points"
      end
      # sleep(2)
    end

  end
end


