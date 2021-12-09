hm = File.readlines('heightmap').map { |l| l.chomp.split('').map &:to_i }

pp hm.map.with_index { |l, i|
  l.map.with_index { |n, j|
    adjacents = [i > 0 ? hm[i-1][j] : nil] +
      [j > 0 ? hm[i][j-1] : nil] +
      [j < l.count-1 ? hm[i][j+1] : nil] +
      [i < hm.count-1 ? hm[i+1][j] : nil]

    n < adjacents.reject(&:nil?).min ? n : nil
  }.reject(&:nil?)
}.flatten.inject(0) { |sum, n| n+1+sum }