lines = File.readlines('lines').map { |line| line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map &:to_i }
map = {}

lines.each do |x1, y1, x2, y2|
  xr = x1.step(to: x2, by: x1 <= x2 ? 1 : -1).to_a
  yr = y1.step(to: y2, by: y1 <= y2 ? 1 : -1).to_a
  xr = Array.new(yr.length, xr[0]) if xr.length == 1
  yr = Array.new(xr.length, yr[0]) if yr.length == 1
  range = xr.zip yr

  range.each do |x, y|
    map[y] = {} if map[y].nil?
    map[y][x].nil? ? map[y][x] = 1 : map[y][x] += 1
  end
end

pp map.map { |y, xs| xs.values.select { |x| x > 1 } }.flatten.count