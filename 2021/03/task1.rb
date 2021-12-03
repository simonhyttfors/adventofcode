report = File.readlines('report').map &:chomp
gamma = epsilon = ''

12.times do |i|
  bits = report.map { |r| r[i] }
  gamma += "#{bits.max_by { |j| bits.count j }}"
  epsilon += "#{bits.min_by { |j| bits.count j }}"
end

gamma = gamma.to_i 2
epsilon = epsilon.to_i 2

pp gamma*epsilon