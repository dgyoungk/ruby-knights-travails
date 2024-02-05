# Adjacency List: it's supposed to be an array of lists,
# but I'm gonna use a hash since each vertex is gonna be an array [num, num] of coordinates
# hash key: coords
# value for hash key: LinkedList of all the nodes that are adjacent to the key (vertex)
require_relative 'node.rb'
require_relative 'knight.rb'

class Board
  attr_accessor :squares
  attr_reader :k_moves, :coordinates

  def initialize
    self.squares = {}
    @coordinates = (0..7).to_a.repeated_permutation(2).to_a
    @k_moves = Knight.new.possible_moves
    build_graph
    graph_edges
  end

  def add_node(node)
    self.squares[node.coords] = node
  end

  def add_edges(node1, node2)
    self.squares[node1].add_vertex(self.squares[node2])
    self.squares[node2].add_vertex(self.squares[node1])
  end

  def build_graph
    # iterate through the coordinates, make a new Node object, and call add_node
    coordinates.each do |pair|
      new_node = Node.new(pair)
      add_node(new_node)
    end
  end

  def graph_edges
    self.squares.each do |coords, node|
      k_moves.each do |move|
        unless self.squares[[coords.first + move.first, coords.last + move.last]].nil?
          add_edges(coords, [coords.first + move.first, coords.last + move.last])
        end
      end
    end
  end


  def knight_moves(start_coords, end_coords, parent = {}, visited = [], to_visit = [], dist = {})
    if start_coords.any? { |coord| coord < 0 || coord > 7 } || end_coords.any? { |coord| coord < 0 || coord > 7 }
      display_error_msg(start_coords, end_coords)
      return
    end
    # parent keeps track of the node path, to_visit is the queue, dist keeps track of each node's edge count from the starting coords
    visited << self.squares[start_coords]
    to_visit << self.squares[start_coords]
    parent[start_coords] = self.squares[start_coords]
    dist[start_coords] = 0
    while !to_visit.empty?
      current_node = to_visit.shift
      current_node.neighbours.each do |node|
        unless visited.include?(node)
          to_visit << node
          visited << node
          parent[node.coords] = current_node
          dist[node.coords] = dist[current_node.coords] + 1
        end
      end
    end
    moves_output(dist, parent, start_coords, end_coords)
  end

  def display_error_msg(start_coords, end_coords)
    puts %(The square with coordinates #{self.squares[start_coords].nil? ? start_coords : end_coords} doesn't exist)
  end

  def moves_output(dist, parent, start_coords, end_coords)
    path = []
    destination = self.squares[end_coords]
    path << destination
    while parent[destination.coords] != self.squares[start_coords]
      path << parent[destination.coords]
      destination = parent[destination.coords]
    end
    path << self.squares[start_coords]
    puts %(Moving from #{start_coords} to #{end_coords} took #{dist[end_coords]} move(s):)
    path.size.downto(0) do |n|
      p path[n].coords unless path[n].nil?
    end
  end
end
