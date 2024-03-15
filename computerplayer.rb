require_relative 'player'
require 'byebug'

class ComputerPlayer < Player
    def make_move(board)
        display.render
        @board = board
        chosen_piece = get_moveable_pieces(board).sample
        board.move_piece!(chosen_piece.pos, chosen_piece.moves.sample)    
        system('clear')  
    end

    def get_moveable_pieces(board)
        board.my_pieces(color).select { |piece| !piece.moves.empty? }
    end 
end