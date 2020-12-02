passwords = File.readlines('passwords').map(&:chomp).map { |p| ['span', 'letter', 'password'].zip(p.split).to_h }
def count_valids(pass_list, valids = 0)
  if pass_list.empty?
    valids
  else
    current = pass_list.first
    if current['password'].count(current['letter'][0]).between?(*current['span'].split('-').map(&:to_i))
      valids += 1
    end
    count_valids pass_list[1..-1], valids
  end
end
p count_valids passwords