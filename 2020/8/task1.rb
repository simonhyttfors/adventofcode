@instructions = File.readlines('prog').map(&:chomp).map { |i| { ins: i.split[0], arg: i.split[1].to_i }}
def calc_acc(line, acc = 0, processed_lines = [])
  return acc if processed_lines.include? line
  i = @instructions[line]
  return calc_acc(line+1, acc, processed_lines.push(line)) if i[:ins] == 'nop'
  return calc_acc(line+1, acc+i[:arg], processed_lines.push(line)) if i[:ins] == 'acc'
  return calc_acc(line+i[:arg], acc, processed_lines.push(line)) if i[:ins] == 'jmp'
end
pp calc_acc 0