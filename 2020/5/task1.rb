passes = File.readlines('passes').map &:chomp
def calc_id(pass, rows = 0..127, cols = 0..8)
  return rows.first*8+cols.first if pass.empty?
  return calc_id(pass[1..-1], rows, cols.each_slice(cols.count/2).to_a[pass[0] == 'L' ? 0 : 1]) if pass.size <= 3
  calc_id pass[1..-1], rows.each_slice(rows.count/2).to_a[pass[0] == 'F' ? 0 : 1] if pass.size >= 4
end
p passes.map(&method(:calc_id)).max