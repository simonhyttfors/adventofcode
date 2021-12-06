@bingo = File.readlines('bingo').map(&:chomp).reject &:empty?
@numbers = @bingo.first.split(',').map &:to_i
@boards = @bingo[1..-1].map { |l| l.split.map &:to_i }.each_slice(5).map { |a, b, c, d, e| [a, b, c, d, e] }
@winning_boards = []
@last_winning_board_index = nil

def find_bingo
  @numbers.each.with_index do |number, i|
    @boards.each.with_index do |board, j|
      check_board(j, number) unless @winning_boards.include?(j)
      
      if @last_winning_board_index != nil
        return @boards[@last_winning_board_index].flatten.reject(&:nil?).sum*number
      end
    end
  end
end

def check_board(index, number)
  @boards[index].each.with_index do |row, k|
    @boards[index][k].each.with_index do |num, l|
      if @boards[index][k][l] == number
        @boards[index][k][l] = nil
      
        if @boards[index][k].all?(nil) || @boards[index].map { |r| r[l] }.all?(nil) # bingo!
          @winning_boards << index
          @last_winning_board_index = index if @winning_boards.count == @boards.count
          return
        end
      end
    end
  end
end

pp find_bingo
