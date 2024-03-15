class Piece
    attr_accessor :pos
    attr_reader :color
                        
    def initialize(color, board, pos)
        raise "color is invalid!" if ![:black, :white].include?(color)
        @color, @board, @pos = color, board, pos
    end

    def valid_moves    #2 distinct boards   
        get_valid_moves(board.dup, board)      
    end                               

    def empty?
        self.is_a?(NullPiece) ? true : false
    end

protected
    attr_accessor :board

private
    def update_board_for_pieces(pieces, board)
        pieces.each_with_index { |piece, i| piece.board = board }        
    end

    def move_into_check?(end_pos, test_board)
        test_board.move_piece!(pos, end_pos)
        test_board.in_check?(color)
    end

    def get_valid_moves(test_board, pieces_board)
        update_board_for_pieces(opponent_pieces(test_board), test_board)
        valid_moves = moves.reject { |move| move_into_check?(move, test_board) }
        update_board_for_pieces(opponent_pieces(test_board), pieces_board)
        valid_moves
    end

    def opponent_pieces(board)
        board.opponent_pieces(color)
    end
end