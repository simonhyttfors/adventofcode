inventory = File.readlines('input').map &:strip

p inventory.chunk(&:empty?).map { |c| c.last.sum { |a, b| a.to_i + b.to_i }}.max(3).sum