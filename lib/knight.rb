class Knight
  attr_accessor :moves
  def initialize
    self.moves = [
      [-2, -1],
      [-2, 1],
      [2, -1],
      [2, 1],
      [-1, 2],
      [1, 2],
      [-1, -1],
      [1, -2],
    ]
  end
end

# should I add an attribute to the Board Node so that at any point the Node can store the knight object
# like occupied_by and the value can be the knight object
# that way I can search for the current position of the knight object, and select the move to transfer the knight
# from one node to another
