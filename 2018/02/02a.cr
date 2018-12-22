has_3 = has_2 = 0
File.each_line("input") do |l|
  counts = Hash(Char, Int32).new(0)
  l.each_char { |c| counts[c] += 1 }
  has_3 += 1 if counts.has_value?(3)
  has_2 += 1 if counts.has_value?(2)
end
puts has_3 * has_2
