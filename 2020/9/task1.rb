stream = File.readlines('stream').map &:to_i

def find_off_number(stream, preamble_size = 25, last_valid = 0)
  return nil if stream.size < preamble_size
  return stream[preamble_size] unless possible_sums(stream[0..preamble_size-1]).include? stream[preamble_size]
  return find_off_number stream[1..-1], preamble_size, stream[preamble_size]
end

def possible_sums(array)
  array.map.with_index { |n, i| remove_at(array, i).map { |k| n+k }}.flatten.sort.uniq
end

def remove_at(array, index)
  array.reject.with_index { |e, i| i == index }
end

pp find_off_number stream