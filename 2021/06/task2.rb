fish = File.read('fish').split(',').map &:to_i
gens = (0..8).map { |i| fish.count i }
gens_tmp = gens.clone

256.times do |i|
  gens.each.with_index do |g, i|
    if 8-(i+1) >= 0
      gens_tmp[8-(i+1)] = gens[8-i]
    else
      gens_tmp[8] = gens[0]
      gens_tmp[6] += gens[0]
    end
  end

  gens = gens_tmp.clone
end

pp gens.sum