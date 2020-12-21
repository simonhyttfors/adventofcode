@seats = File.readlines('seats').map { |l| l.chomp.split('') }

def get_adjacents_from_seat(map, row, index)
  adjacents = ""
  [[-1, -1], [0, -1], [1, -1],
   [-1,  0], [1,  0],
   [-1,  1], [0,  1], [1,  1]].each do |x, y|
    adjacents += (row+y >= 0 && row+y < map.size) && (index+x >= 0 && index+x < map.first.size) ? map[row+y][index+x] : ''
  end
  
  return adjacents
end

def simulate_plebs(seat_map, changed = true)
  return seat_map unless changed
  
  new_map, updated = [], false
  seat_map.each.with_index do |row, y|
    new_row = row.clone.map &:clone
    row.each.with_index do |seat, x|
      unless seat == '.'
        if seat == '#' && get_adjacents_from_seat(seat_map, y, x).count('#') >= 4
          new_row[x] = 'L'
          updated = true
        elsif seat == 'L' && get_adjacents_from_seat(seat_map, y, x).count('#') == 0
          new_row[x] = '#'
          updated = true
        end
      end
    end
    new_map << new_row
  end
  
  return simulate_plebs new_map, updated
end

pp simulate_plebs(@seats).map(&:join).join.count '#'