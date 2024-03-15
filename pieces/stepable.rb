module Stepable
    L_MOVES        = [ [2,1], [1,2], [-2,-1], [-1,-2], [2,-1], [1,-2], [-2,1], [-1,2] ].freeze
    ADJACENT_MOVES = [ [1,1], [-1,-1], [1,-1], [-1,1], [-1,0], [1,0], [0,-1], [0, 1]  ].freeze

    def moves
        move_diffs
            .map { |(dx,dy)| [pos.first + dx, pos.last + dy] }
            .select { |pos| board.valid_pos?(pos) }
            .select { |pos| board[pos].empty? || (!board[pos].empty? && board[pos].color != color) }
    end
end