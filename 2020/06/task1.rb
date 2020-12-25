groups = File.read('answers').split("\n\n").map { |a| a.split("\n") }
p groups.map { |group| ('a'..'z').zip([0]*26).map { |k,v| [k, (group.join.include?(k) ? 1 : 0)] }.to_h.values.sum }.sum