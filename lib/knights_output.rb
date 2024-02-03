require_relative 'board.rb'
require_relative 'knight.rb'

testing = Board.new

# allowed_moves = testing.squares[[1,2]].neighbours

# allowed_moves.each do |node|
#   p node.coords
# end

test_move = testing.knight_moves([3,3], [4,3])

# test_move.each do |key, value|
#   puts %(node position: #{key}, distance from starting node: #{value})
# end

# p test_move
