total = 0
seen = {0 => true}
loop do
  break if File.each_line("input") do |l|
             total += l.to_i
             break true if seen[total]?
             seen[total] = true
           end
end
puts total
