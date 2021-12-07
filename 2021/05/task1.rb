lines = File.readlines('lines').map { |line| line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map &:to_i }
horizontals = lines.select { |x1, y1, x2, y2| x1 == x2 || y1 == y2 }
map = {}

horizontals.each do |x1, y1, x2, y2|
  ([y1, y2].min..[y1, y2].max).each do |y|
    map[y] = {} if map[y].nil?
    ([x1, x2].min..[x1, x2].max).each do |x|
      map[y][x].nil? ? map[y][x] = 1 : map[y][x] += 1
    end
  end
end

pp map.map { |y, xs| xs.values.select { |x| x > 1 } }.flatten.count