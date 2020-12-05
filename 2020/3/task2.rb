map = File.readlines('map').map &:chomp
def count_trees(trees_array, index, x, y, trees = 0)
  return (trees_array.first[index] == '#' ? trees+1 : trees) if trees_array.size-y < 1
  count_trees trees_array[y..-1], (index+x) % 31, x, y, trees_array.first[index] == '#' ? trees+1 : trees
end
p [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map { |x, y| count_trees(map[y..-1], x, x, y) }.reject(&:zero?).inject :*