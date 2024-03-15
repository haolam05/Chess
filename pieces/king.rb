require_relative 'piece'
require_relative 'stepable'

class King < Piece  
    include Stepable  

    def symbol
        '♚'
    end  

protected
    def move_diffs
        ADJACENT_MOVES
    end
end

# k = King.new(:white, [], [3,3])
# p k.moves

#   0 1 2 3 4 5 6 7
# 0          
# 1     
# 2     x x x
# 3     x . x 
# 4     x x x
# 5       
# 6       
# 7                