require_relative 'pieces'
require_relative 'errors'
require 'byebug'

class Board
    attr_reader :rows

    def initialize(allow_set_up = true, rows = Array.new(8) { Array.new(8, null_piece) })
        @rows = rows
        setup_board if allow_set_up
    end
    
    def [](pos)
        raise InvalidPosition if !valid_pos?(pos)
        rows[pos.first][pos.last]
    end

    def move_piece(color, start_pos, end_pos) 
        raise EmptyPositionError if null_piece?(start_pos)
        raise MoveWrongPieceError if self[start_pos].color != color
        raise PieceDoesNotMoveLikeThat if !self[start_pos].moves.include?(end_pos)
        raise MoveIntoCheckError if !self[start_pos].valid_moves.include?(end_pos)
        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = null_piece
        self[end_pos].pos = end_pos
    end
 
    def checkmate?(color)
        in_check?(color) && my_pieces(color).all? { |piece| piece.valid_moves.empty? }
    end

    def in_check?(color)
        opponent_pieces(color).any? { |piece| piece.moves.include?(find_king(color)) }
    end

    def valid_pos?(pos)
        pos.all? { |n| n.between?(0, 7) }
    end

    def pieces
        rows.flatten.select { |piece| piece.symbol != ' ' }
    end

    def opponent_pieces(color)
        pieces.select { |piece| piece.color != color }
    end

    def my_pieces(color)
        pieces.select { |piece| piece.color == color }
    end
    
    def dup
        Board.new(false, deep_dup(rows))
    end

private 
    def deep_dup(arr)
        return arr if !arr.is_a?(Array)
        copy_arr = []
        arr.each { |el| copy_arr << (el.is_a?(Array) ? deep_dup(el) : el) }
        copy_arr
    end

    def null_piece?(pos)
        self[pos].is_a?(NullPiece)       
    end

    def null_piece
        NullPiece.instance
    end

    def find_king(color)
        pieces.each { |piece| return piece.pos if piece.is_a?(King) && piece.color == color }
    end

    def setup_board
        (0...rows.length).each { |i| (back_rows.include?(i) ? assign_back_rows(i) : assign_pawn_rows(i)) if back_and_pawn_rows.include?(i) }
    end

    def assign_back_rows(i)
        [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index { |piece, j| @rows[i][j] = piece.new(color(i), self, [i,j]) }
    end

    def assign_pawn_rows(i)
        (0...rows.length).each { |j| @rows[i][j] = Pawn.new(color(i), self, [i,j]) }
    end

    def back_rows
        [0, 7]
    end

    def pawn_rows
        [1, 6]
    end

    def back_and_pawn_rows
        back_rows + pawn_rows
    end

    def color(i)
        i == 0 || i == 1 ? :black : :white
    end

    def []=(pos, val)
        raise "Invalid position" if !valid_pos?(pos)
        @rows[pos.first][pos.last] = val
    end
end

# b = Board.new
# b.render
# # b.render
# b.move_piece([6,5], [5,5])
# b.render
# # b.move_piece([1,4], [3,4])
# # b.render
# # b.move_piece([6,6], [4,6])
# # b.render
# # b.move_piece([0,3], [4,7])
# # b.render

# # p b.find_king(:white)
# # p b.find_king(:black)
# # p b.in_check?(:white)
# # p b.in_check?(:black)

# # b.rows.first.first.valid_moves
# # p b.dup
# puts "---------------------------"
# new_board = b.dup
# new_board.render
# new_board.move_piece([1,4], [3,4])

# puts '==========================='
# puts '==========================='
# puts '==========================='
# b.render
# puts
# new_board.render


#a = test_board.opponent_pieces(color).map { |piece| piece.pos  }
#queen_moves: test_board.opponent_pieces(color)[15].moves
# test_board.find_king(color)
# test_board.opponent_pieces(color)[15].board.render

# rows = 

#     [      el
#         [ piece1 ], [ piece2 ], [...]
#     ]


    # def render
    #     rows.map { |row| row.map { |piece| piece.symbol } }.each { |row| puts "#{row.join(' ')}" }
    # end    


#test_board : object_id #2
#piece.board: object_id #3