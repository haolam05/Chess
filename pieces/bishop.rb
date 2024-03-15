require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable
    
    def symbol
        '♝'
    end    

protected
    def move_dirs
        DIAGONAL_DIRECTIONS
    end
end

# b = Bishop.new(:white, [], [3,3])
# p b.moves

#   0 1 2 3 4 5 6 7
# 0 x           x
# 1   x       x
# 2     x   x
# 3       .
# 4     x   x
# 5   x       x
# 6 x           x
# 7               x
