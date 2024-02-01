class BoardNode
  attr_accessor :column_num, :next_square, :prev_square, :below, :above

  def initialize(column_num, next_square = nil, prev_square = nil, below = nil, above = nil)
    self.column_num = column_num
    self.next_square = next_square
    self.prev_square = prev_square
    self.below = below
    self.above = above
  end

  def add_edge(adjacent)
    self.neighbours << adjacent
  end
end
