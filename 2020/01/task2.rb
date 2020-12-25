nums = File.read('input').split.map &:to_i
nums.each.with_index do |num_x, i|
  nums[i+1..-1].each.with_index do |num_y, j|
    sum = num_x+num_y
    diff = 2020-sum
    puts "#{num_x}*#{num_y}*#{diff}=#{num_x*num_y*diff}" if nums[i+1..-1].include?(diff)
  end
end