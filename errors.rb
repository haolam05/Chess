class InvalidPosition < StandardError
end

class InvalidColor < StandardError
end

class EmptyPositionError < StandardError
    def message
        puts "Start position is empty!"
    end
end

class MoveError < StandardError
    def message
        puts "Invalid move!"
    end
end

class MoveIntoCheckError < MoveError
    def message
        super
        puts "You cannot move into check!"
    end
end

class MoveWrongPieceError < MoveError
    def message
        super
        puts "Must move your own piece!"
    end
end

class PieceDoesNotMoveLikeThat < MoveError
    def message
        super
        puts "Piece does not move like that!"
    end
end