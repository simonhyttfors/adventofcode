@all_adapters = File.readlines('adapters').map(&:to_i).sort

def calc_chain(adapters, joltage = 0, differences = [0, 0, 1])
  return differences[0]*differences[2] if adapters.empty?
  differences[adapters[0]-joltage-1] += 1
  return calc_chain(adapters[1..-1], adapters[0], differences)
end

pp calc_chain @all_adapters