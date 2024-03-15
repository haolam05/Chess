require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable  

    def symbol
        '♞'
    end 
   
protected
    def move_diffs
        L_MOVES
    end
end

# k = Knight.new(:white, [], [3,3])
# p k.moves

#   0 1 2 3 4 5 6 7
# 0          
# 1     x   x
# 2   x       x    
# 3       . 
# 4   x       x
# 5     x   x
# 6       
# 7   