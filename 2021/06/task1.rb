fish = File.read('fish').split(',').map &:to_i

80.times do |i|
  preggos = fish.count 0
  fish = fish.map { |f| f-1 < 0 ? 6 : f-1 } + Array.new(preggos, 8)
end

pp fish.count