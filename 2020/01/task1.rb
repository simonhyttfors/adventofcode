nums = File.read('input').split.map &:to_i
nums.each do |num|
  diff = 2020-num
  puts "#{num}*#{diff}=#{num*diff}" if nums.include?(diff)
end