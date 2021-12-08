crabs = File.read('crabs').split(',').map &:to_i

pp (crabs.min..crabs.max).map { |h_pos| crabs.map { |crab| dist = (crab-h_pos).abs; dist*(dist+1)/2 }.sum}.min