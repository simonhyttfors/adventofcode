chunks = File.readlines('chunks').map &:chomp
brackets = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
incompletes = []

chunks.each.with_index do |line, i|
  closing_brackets = []
  corrupt = false

  line.each_char do |c|
    if brackets.keys.include? c
      closing_brackets << brackets[c]
    else
      if c == closing_brackets.last
        closing_brackets.pop
      else
        corrupt = true
        closing_brackets.pop
      end
    end
  end

  incompletes << closing_brackets.reverse unless corrupt
end

scores = incompletes.map.with_index { |line| line.inject(0) { |score, b| 5*score+([')', ']', '}', '>'].index(b)+1) }}
pp scores.sort[scores.count/2]