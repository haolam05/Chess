require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    attr_reader :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
        bkgrd = [:green, :blue]

        @board.rows.each_with_index do |row, i|
            row.each.with_index { |piece, j| print output(piece, choose_bkgrd_color([i, j], bkgrd)) }
            bkgrd.rotate!
            puts
        end
    end

    def output(piece, bkgrd_color)
        "  #{piece.symbol}  ".colorize(:background => bkgrd_color, :color => piece.color)
    end
 
    def choose_bkgrd_color(pos, bkgrd)
        return :grey if pos == cursor.cursor_pos && cursor.selected
        pos == cursor.cursor_pos ? :red : (pos.last.even? ? bkgrd.first : bkgrd.last)
    end
end