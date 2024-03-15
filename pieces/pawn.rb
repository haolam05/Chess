require_relative 'piece'

class Pawn < Piece
    def moves
        side_steps + forward_steps
    end  
    
    def forward_steps
        step_1 = [pos.first + forward_dir, pos.last]
        step_2 = [pos.first + (2 * forward_dir), pos.last]
        empty_and_valid?(step_1) ? (at_start_row? && is_empty?(step_2) ? [step_1] + [step_2] : [step_1]) : []
    end
    
    def side_steps
        side_attacks.select { |pos| board.valid_pos?(pos) && !board[pos].empty? && board[pos].color != color }
    end

    def at_start_row?
        (pos.first == 1 && forward_dir == 1) || (pos.first == 6 && forward_dir == -1)
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def empty_and_valid?(pos)
        is_valid?(pos) && is_empty?(pos)
    end

    def is_valid?(pos)
        board.valid_pos?(pos)
    end

    def is_empty?(pos)
        board[pos].empty?
    end

    def side_attacks
        [[pos.first + forward_dir, pos.last + forward_dir], [pos.first + forward_dir, pos.last - forward_dir]]
    end

    def symbol
        '♟'
    end
end