class Node
  # I want to save the chess board coords as the data value for each node to indicate the location of the node
  # in relation to the board
  attr_accessor :coords, :neighbours

  def initialize(coords)
    self.coords = coords
    self.neighbours = []
  end

  def add_vertex(adjacent)
    self.neighbours << adjacent
  end

  # def to_s
  #   formatted = ''
  #   formatted += %(Column Number: #{column_num}\n)
  #   formatted += %(Next Square: #{next_square.nil? ? 'none' : next_square.column_num}\n)
  #   formatted += %(Previous Square: #{prev_square.nil? ? 'none' : prev_square.column_num}\n)
  #   neighbours.each do |neighbour|
  #     formatted += %(Adjacent: #{neighbour.column_num}\n)
  #   end
  #   formatted
  # end
end
