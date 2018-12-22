fabric = Array(Array(Array(Int32))).new
ids = Array(Int32).new
overlaps = Set(Int32).new

File.each_line("input") do |l|
  id, left, top, width, height = l.scan(/\d+/).map(&.[0].to_i)
  ids << id
  bottom = top + height - 1
  right = left + width - 1

  (bottom - fabric.size + 1).times { fabric << Array(Array(Int32)).new }

  (top..bottom).each do |row|
    fabric_row = fabric[row]

    (right - fabric_row.size + 1).times { fabric_row << Array(Int32).new }

    (left..right).each do |col|
      fabric_cell = fabric_row[col]

      fabric_cell << id
      overlaps.concat(fabric_cell) unless fabric_cell.size == 1
    end
  end
end

puts ids - overlaps.to_a
