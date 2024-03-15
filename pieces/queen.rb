require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def symbol
        '♛'
    end

protected
    def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRECTIONS + DIAGONAL_DIRECTIONS
    end
end

# q = Queen.new(:white, [], [3,3])
# p q.moves

#   0 1 2 3 4 5 6 7
# 0 x     x     x   
# 1   x   x   x
# 2     x x x
# 3 x x x . x x x x  
# 4     x x x
# 5   x   x   x
# 6 x     x     x
# 7       x       x