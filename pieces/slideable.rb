module Slideable
    HORIZONTAL_AND_VERTICAL_DIRECTIONS = [ [-1,0], [1,0], [0,-1], [0,1]   ].freeze
    DIAGONAL_DIRECTIONS                = [ [1,1], [-1,-1], [1,-1], [-1,1] ].freeze

    def moves
        moves = []
        move_dirs.each { |dir| moves += grow_unblocked_moves_in_dir(dir.first, dir.last) }
        moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []

        new_pos = [pos.first + dx, pos.last + dy]
        while board.valid_pos?(new_pos)
            if !board[new_pos].empty?
                moves << new_pos if board[new_pos].color != color 
                break 
            end

            moves << new_pos
            new_pos = [new_pos.first + dx, new_pos.last + dy]                   
        end 
        
        moves
    end
end