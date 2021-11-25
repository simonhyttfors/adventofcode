program, cur, mask = File.readlines('program').map(&:chomp), 0, ''
mem = {}

while cur < program.size
  if program[cur].start_with? 'mask'
    mask = program[cur].split.last
  else
    addr, val = program[cur].match(/mem\[(\d*)\] = (\d*)/).captures.map &:to_i
    val = '%036b' % val
    mask.gsub(/\d/).map { Regexp.last_match.begin 0 }.each do |i|
      val[i] = mask[i]
    end
    mem[addr] = val
  end

  cur += 1
end

pp mem.map { |e| e.last.to_i 2 }.sum