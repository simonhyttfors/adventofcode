course = File.readlines('course').map &:chomp

x = y = 0

course.each do |c|
  dir, len = c.match(/(forward|up|down) (\d+)/).captures

  case dir
  when 'forward'
    x += len.to_i
  when 'up'
    y -= len.to_i
  when 'down'
    y += len.to_i
  end
end

pp x*y