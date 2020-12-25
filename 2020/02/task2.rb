passwords = File.readlines('passwords').map(&:chomp).map { |p| ['span', 'letter', 'password'].zip(p.split).to_h }
def count_valids(pass_list, valids = 0)
  if pass_list.empty?
    valids
  else
    current = pass_list.first
    pos = [current['span'].split('-').first.to_i, current['span'].split('-').last.to_i]
    score = 0
    pos.each do |p|
      if current['password'][p-1] == current['letter'][0]
        score = (score+1) % 2
      end
    end
    valids += score  
    count_valids pass_list[1..-1], valids
  end
end
p count_valids passwords