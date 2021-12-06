@bingo = File.readlines('bingo').map(&:chomp).reject &:empty?
@numbers = @bingo.first.split(',').map &:to_i
@boards = @bingo[1..-1].map { |l| l.split.map &:to_i }.each_slice(5).map { |a, b, c, d, e| [a, b, c, d, e] }

def find_bingo
  @numbers.each.with_index do |number, i|
    @boards.each.with_index do |board, j|
      board.each.with_index do |row, k|
        row.each.with_index do |num, l|
          @boards[j][k][l] = nil if num == number
          
          if @boards[j][k].all?(nil) || @boards[j].map { |r| r[l] }.all?(nil)
            return @boards[j].flatten.reject(&:nil?).sum*number
          end
        end
      end
    end
  end
end

pp find_bingo
