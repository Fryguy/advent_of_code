guard = sleep_start = nil
total = Hash(Int32, Int32).new(0)
minutes = Hash(Int32, Array(Int32)).new

File.read_lines("input").sort.each do |l|
  time = Time.parse_utc(l[1, 16], "%Y-%m-%d %H:%M")

  case l[19..-1]
  when "wakes up"
    asleep = (time - sleep_start.not_nil!).to_i / 60
    total[guard.not_nil!] += asleep
    asleep.times { |m| minutes[guard.not_nil!][sleep_start.not_nil!.minute + m] += 1 }
  when "falls asleep"
    sleep_start = time
  when /\AGuard #(\d+) begins shift\z/
    guard = $1.to_i
    minutes[guard] ||= Array(Int32).new(60, 0)
  end
end

guard, _time = total.max_by { |(_guard, time)| time }
minute = minutes[guard].index(minutes[guard].max).not_nil!
puts guard * minute
