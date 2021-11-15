earliest_dep, buses = File.readlines('notes').map.with_index { |x, i|
  i == 0 ? x.to_i : x.split(',').reject {|e| e == 'x'}.map(&:to_i)}

closest_dep = buses.map { |id| [id, earliest_dep+id-(earliest_dep % id)] }.min { |a, b| a.last <=> b.last }

pp (closest_dep.last-earliest_dep)*closest_dep.first