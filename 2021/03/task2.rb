@report = File.readlines('report').map &:chomp

def find_value(o2 = true)
  readings, cur = @report, 0

  while readings.count > 1 && cur < 12
    bits = readings.map { |r| r[cur] }

    if bits.count('1') == bits.count('0')
      readings = readings.select { |e| e[cur] == (o2 ? '1' : '0') }
    else
      max = bits.max_by { |i| bits.count i }
      min = bits.min_by { |i| bits.count i }
      readings = readings.select { |e| e[cur] == (o2 ? max : min) }
    end

    cur += 1
  end

  readings.first
end

pp find_value.to_i(2)*find_value(false).to_i(2)