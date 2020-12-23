@seats = File.readlines('seats').map { |l| l.chomp.split('') }

def get_first_seats_in_sight(seat_map, row, index)
  adjacents = ''
  [[-1, -1], [0, -1], [1, -1],
   [-1,  0], [1,  0],
   [-1,  1], [0,  1], [1,  1]].each do |x, y|
    seat = find_first_seat_in_direction seat_map, index, row, x, y
    adjacents += seat ? seat : ''
  end
  
  return adjacents
end

def find_first_seat_in_direction(seat_map, seat_x, seat_y, dir_x, dir_y)
  return nil if (seat_x+dir_x < 0 || seat_x+dir_x > seat_map.first.size-1) || (seat_y+dir_y < 0 || seat_y+dir_y > seat_map.size-1)
  seat = seat_map[seat_y+dir_y][seat_x+dir_x]
  return seat if seat == '#' || seat == 'L'
  return find_first_seat_in_direction seat_map, seat_x+dir_x, seat_y+dir_y, dir_x, dir_y
end

def simulate_plebs(seat_map, changed = true)
  return seat_map unless changed
  
  new_map, updated = [], false
  seat_map.each.with_index do |row, y|
    new_row = row.clone.map &:clone
    row.each.with_index do |seat, x|
      unless seat == '.'
        if seat == '#' && get_first_seats_in_sight(seat_map, y, x).count('#') >= 5
          new_row[x] = 'L'
          updated = true
        elsif seat == 'L' && get_first_seats_in_sight(seat_map, y, x).count('#') == 0
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