@rules = File.readlines('rules').map { |rule|
  rule = rule.chomp[0..-2]
  fragments = rule.split('contain')
  {
    color: fragments.first.split[0..-2].join(' '),
    bags: [*fragments.last.split(', ').map { |bag| [bag.split[1..-2].join(' ')] }.flatten]
  }
}
def can_hold_shiny_gold_bag?(rule)
  return false if rule[:bags].first == 'other' # 'no other bags' = empty
  return true if rule[:bags].include? 'shiny gold'
  can_hold = rule[:bags].map { |bag|
    return true if can_hold_shiny_gold_bag? @rules.select { |r| r[:color] == bag }.first
  }.count(true) > 1
  return can_hold
end
p @rules.select { |rule| can_hold_shiny_gold_bag? rule }.count