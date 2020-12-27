@instructions = File.readlines('instructions').map &:chomp
@directions = { 'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0] }

def add_coords(coords, delta)
  [coords, delta].transpose.map &:sum
end

def multiply_coords(coords, mul)
  coords.collect { |c| c*mul }
end

def rotate_cw_90_deg(xy, times = 1)
  return [xy.last, -xy.first] if times < 2
  return rotate_cw_90_deg [xy.last, -xy.first], times-1
end

def add_distances(instructions, waypoint = [10, 1], coords = [0, 0])
  return coords.inject { |sum, n| sum.abs+n.abs } if instructions.empty?
  instr, value = *instructions.first.scan(/([NSEWLRF])(\d*)/).flatten
  unless instr == 'F'
    return add_distances instructions[1..-1], add_coords(waypoint, multiply_coords(@directions[instr], value.to_i)), coords if "NSEW".include? instr
    quadrants = value.to_i/90%4
    return add_distances instructions[1..-1], rotate_cw_90_deg(waypoint, instr == 'R' ? quadrants : 4-quadrants), coords
  else
    return add_distances instructions[1..-1], waypoint, add_coords(coords, multiply_coords(waypoint, value.to_i))
  end
end

pp add_distances @instructions