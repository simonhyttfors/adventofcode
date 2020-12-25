@rules = File.readlines('rules').map { |rule|
  rule = rule.chomp[0..-2]
  fragments = rule.split('contain')
  {
    color: fragments.first.split[0..-2].join(' '),
    bags: [*fragments.last.split(', ').map { |bag| { amount: bag.split[0].to_i, color: bag.split[1..-2].join(' ') }}]
  }
}
def count_bags(rule)
  return 0 if rule[:bags].first[:amount] == 0 # 'no other bags' = empty
  return rule[:bags].map { |bag|
    bag[:amount] + bag[:amount]*count_bags(@rules.select { |r| r[:color] == bag[:color] }.first)
  }.sum
end
pp count_bags @rules[56]