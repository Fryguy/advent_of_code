points = File.read_lines("input").map do |l|
  col, row = l.split(",").map(&.strip.to_i)
  {col, row}
end

num_cols = points.map(&.first).max + 1
columns = num_cols.times.to_a
num_rows = points.map(&.last).max + 1
rows = num_rows.times.to_a

alias Point = Tuple(Int32, Int32)
region = Hash(Point, Bool).new

columns.product(rows).each do |coord|
  total = points.sum do |p|
    (p.first - coord.first).abs + (p.last - coord.last).abs
  end

  region[coord] = total < 10_000
end

puts region.count(&.last)
