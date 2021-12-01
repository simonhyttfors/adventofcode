measurements = File.readlines('measurements').map &:to_i

windows = measurements[0..-3].map.with_index do |e, i|
  [e, measurements[i+1], measurements[i+2]].sum
end

pp [0, *windows].each_cons(2).map { |prev, cur| !prev.zero? && cur > prev ? cur : 0 }.reject(&:zero?).count