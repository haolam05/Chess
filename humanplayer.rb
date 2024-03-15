require_relative 'player'

class HumanPlayer < Player
    def make_move(board)
        @pos = []

        until x_and_y_coor_are_selected
            print_chess_board
            prompt_player        
            update_pos
            clear_terminal
        end

        update_board_state(board)
    end

private
    def update_board_state(board)
        board.move_piece(color, pos.first, pos.last)
    end

    def x_and_y_coor_are_selected
        pos.length == 2
    end

    def update_pos
        input = get_input
        pos << input if input.is_a?(Array)
    end

    def prompt_player
        puts "#{color}'s turn. Move #{to_or_from} where?"
    end

    def to_or_from
        pos.length == 1 ? "to" : "from"
    end

    def print_chess_board
        display.render
    end

    def get_input
        display.cursor.get_input 
    end

    def clear_terminal
        system('clear')
    end

    attr_reader :pos
end
