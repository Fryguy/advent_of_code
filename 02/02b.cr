require "levenshtein"

lines = File.read_lines("input")
x, y = lines.each_combination(2).min_by do |(x, y)|
  x == y ? Int32::MAX : Levenshtein.distance(x, y)
end
puts x.delete(x.delete(y))
