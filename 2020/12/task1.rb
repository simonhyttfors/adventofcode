@instructions = File.readlines('instructions').map &:chomp

def add_distances(instructions, facing = 1, coords = [0, 0])
  return coords.inject { |sum, n| sum.abs+n.abs } if instructions.empty?
  instr, value = *instructions.first.scan(/([NSEWLRF])(\d*)/).flatten
  if instr == 'L' || instr == 'R'
    facing = (facing+((value.to_i/90)*(instr == 'R' ? 1 : -1)))%4
    delta = [0, 0]
  else
    delta = parse_instruction instr, value, facing 
  end
  add_distances instructions[1..-1], facing, [coords, delta].transpose.map(&:sum)
end

def parse_instruction(instr, value, facing)
  directions = { 'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0] }
  return directions.values[facing].collect { |i| i*value.to_i } if instr == 'F'
  return directions[instr].collect { |i| i*value.to_i }
end

pp add_distances @instructions