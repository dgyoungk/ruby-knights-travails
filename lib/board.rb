require_relative 'board_node.rb'
require_relative 'linked_list.rb'

class Board
  attr_accessor :squares
  attr_reader :size

  def initialize
    @size = 8
    self.squares = board_init
  end

  def board_init
    chess_board = Array.new(size)
    chess_board.map! do |row|
      row = LinkedList.new
      for i in 0...size
        row.append(i)
      end
      row
    end
    chess_board
  end
end
