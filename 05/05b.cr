polymer = Array(Char?).new
polymer.concat(File.read("input").chomp.chars)

def react(polymer)
  loop do
    change = false
    polymer.each_with_index do |c1, i|
      next if c1.nil? || i == polymer.size - 1

      c2 = polymer[i + 1].not_nil!
      if c1 != c2 && c1.downcase == c2.downcase
        polymer.fill(nil, i, 2)
        change = true
      end
    end
    if change
      polymer.compact!
    else
      break
    end
  end
  polymer
end

sizes = polymer.map(&.not_nil!.downcase).uniq.map do |c|
  edited = polymer.clone.tap do |p|
    p.delete(c.downcase)
    p.delete(c.upcase)
  end
  react(edited).size
end

pp sizes.min
