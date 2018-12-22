points = File.read_lines("input").map do |l|
  col, row = l.split(",").map(&.strip.to_i)
  {col, row}
end

num_cols = points.map(&.first).max + 1
columns = num_cols.times.to_a
num_rows = points.map(&.last).max + 1
rows = num_rows.times.to_a

alias Point = Tuple(Int32, Int32)
closest = Hash(Point, Point?).new

columns.product(rows).each do |coord|
  candidates = points
    .map do |p|
      {point: p, distance: (p.first - coord.first).abs + (p.last - coord.last).abs}
    end
    .sort_by!(&.[:distance])

  min_distance = candidates.first[:distance]
  candidates = candidates.take_while { |c| c[:distance] == min_distance }

  closest[coord] = candidates.size > 1 ? nil : candidates.first[:point]
end

areas = Hash(Point, Int32).new(0)

closest.each do |coord, point|
  next if point.nil?

  if coord.first == 0 || coord.first == num_cols - 1 || coord.last == 0 || coord.last == num_rows - 1
    areas[point] = Int32::MIN
  else
    areas[point] += 1
  end
end

puts areas.values.max
