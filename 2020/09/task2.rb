@stream = File.readlines('stream').map &:to_i

def remove_at(array, index)
  array.reject.with_index { |e, i| i == index }
end

def possible_sums(array)
  array.map.with_index { |n, i| remove_at(array, i).map { |k| n+k }}.flatten.sort.uniq
end

def find_range_values(array, goal)
  small, large = 0, 0
  array.each.with_index do |n, i|
    tmp = array[i..-1]
    sum, rng_len = -1, 2
    
    tmp.each.with_index do |k, j|
      arr = tmp[0..j].sort
      sum = arr.sum
      
      return arr.first+arr.last if sum == goal
    end
  end
  
  return nil
end

def find_off_number(stream, preamble_size = 25)
  return nil if stream.size < preamble_size
  unless possible_sums(stream[0..preamble_size-1]).include? stream[preamble_size]
    return find_range_values @stream, stream[preamble_size]
  end
  return find_off_number stream[1..-1], preamble_size
end

pp find_off_number @stream