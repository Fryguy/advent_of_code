fabric = Array(Array(Int32)).new

File.read_lines("input").each do |l|
  _id, left, top, width, height = l.scan(/\d+/).map(&.[0].to_i)

  bottom = top + height - 1
  right = left + width - 1

  (bottom - fabric.size + 1).times { fabric << Array(Int32).new }

  (top..bottom).each do |row|
    fabric_row = fabric[row]

    (right - fabric_row.size + 1).times { fabric_row << 0 }

    (left..right).each do |col|
      fabric_row[col] += 1
    end
  end
end

puts fabric.flatten.count { |i| i >= 2 }
