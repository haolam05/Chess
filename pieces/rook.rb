require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def symbol
        '♜'
    end    

protected
    def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRECTIONS
    end
end

# r = Rook.new(:white, [], [3,3])
# p r.moves

#   0 1 2 3 4 5 6 7
# 0       x     
# 1       x
# 2       x
# 3 x x x . x x x x  
# 4       x
# 5       x
# 6       x
# 7       x           
