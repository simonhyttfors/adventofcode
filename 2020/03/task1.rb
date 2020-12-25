map = File.readlines('map').map &:chomp
def count_trees(trees_array, index = 3, trees = 0)
  return trees if trees_array.empty?
  count_trees trees_array[1..-1], (index+3) % 31, trees_array.first[index] == '#' ? trees+1 : trees
end
p count_trees map[1..-1]