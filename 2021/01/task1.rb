measurements = File.readlines('measurements').map &:to_i
pp [0, *measurements].each_cons(2).map { |prev, cur| !prev.zero? && cur > prev ? cur : 0 }.reject(&:zero?).count