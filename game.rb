require_relative 'display'
require_relative 'humanplayer'
require_relative 'computerplayer'
require_relative 'board'

class Game
    attr_reader :board, :display, :current_player
    
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = { :black => HumanPlayer.new(:black , @display), :white => ComputerPlayer.new(:white, @display) }
        @current_player = @players[:black]
    end

    def play
        play_one_turn until board.checkmate?(current_player.color)
    end

private
    def swap_turn!
        @current_player = @players[(@current_player.color == :white ? :black : :white)]
    end

    def play_one_turn
        current_player.make_move(board)
        swap_turn!
    rescue EmptyPositionError => error
        error.message
    rescue MoveWrongPieceError => error
        error.message
    rescue PieceDoesNotMoveLikeThat => error
        error.message
        retry
    rescue MoveIntoCheckError => error
        error.message
        retry
    end
end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end