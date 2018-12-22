total = 0
File.each_line("input") { |l| total += l.to_i }
puts total
