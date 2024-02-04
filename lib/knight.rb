class Knight
  attr_accessor :possible_moves
  def initialize
    @possible_moves = [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]
    ]
  end
end
