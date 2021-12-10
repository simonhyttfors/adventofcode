chunks = File.readlines('chunks_min').map &:chomp
brackets = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
corrupted = []

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
        corrupted << c
      end
    end
  end
end

pp corrupted.inject(0) { |sum, c| { ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }[c] + sum }