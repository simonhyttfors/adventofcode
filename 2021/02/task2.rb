course = File.readlines('course').map &:chomp

x = y = aim = 0

course.each do |c|
  dir, len = c.match(/(forward|up|down) (\d+)/).captures

  case dir
  when 'forward'
    x += len.to_i
    y += len.to_i*aim
  when 'up'
    aim -= len.to_i
  when 'down'
    aim += len.to_i
  end
end

pp x*y