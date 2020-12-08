@instructions = File.readlines('prog').map(&:chomp).map { |i| { op: i.split[0], arg: i.split[1].to_i }}
def calc_acc(instructions, line = 0, prev_line = 0, acc = 0, processed_lines = [])
  return { line: line, prev_line: prev_line, acc: acc } if (processed_lines.include?(line) || line > instructions.size-1)
  i = instructions[line]
  return calc_acc(instructions, line+1, line, acc, processed_lines.push(line)) if i[:op] == 'nop'
  return calc_acc(instructions, line+1, line, acc+i[:arg], processed_lines.push(line)) if i[:op] == 'acc'
  return calc_acc(instructions, line+i[:arg], line, acc, processed_lines.push(line)) if i[:op] == 'jmp'
end
@instructions.each.with_index do |ins, index|
  mutated = @instructions.clone.map &:clone # deep copy, ruby behaves like proper shite tbh
  mutated[index][:op] = 'nop' if ins[:op] == 'jmp'
  mutated[index][:op] = 'jmp' if ins[:op] == 'nop'
  result = calc_acc mutated
  pp result[:acc] if result[:line] > @instructions.size-1
end