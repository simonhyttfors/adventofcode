crabs = File.read('crabs').split(',').map &:to_i

pp crabs.sort.map { |h_pos| crabs.map { |crab| (crab-h_pos).abs }.sum }.min