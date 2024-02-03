# Adjacency List: it's supposed to be an array of lists,
# but I'm gonna use a hash since each vertex is gonna be an array [num, num] of coordinates
# hash key: coords
# value for hash key: LinkedList of all the nodes that are adjacent to the key (vertex)
require_relative 'node.rb'

class Board
  attr_accessor :squares

  def initialize
    self.squares = {}
    @coordinates = (0..7).to_a.repeated_permutation(2).to_a
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
    @coordinates.each_with_index do |pair, idx|
      new_node = Node.new(pair)
      add_node(new_node)
    end
  end

  def graph_edges
    # to add edges I need 2 node coords, how do I get the other one...
    # pick it up here, figure out how to calculate the index of the next item
    self.squares.each_with_index do |(coords, node), idx|
      row = squares.select { |coords, node| coords.first == idx }
      row.each do |coords, node|
        # case for first row
        add_edges(coords, [coords.first + 2, coords.last + 1]) unless self.squares[[coords.first + 2, coords.last + 1]].nil?
        add_edges(coords, [coords.first + 2, coords.last - 1]) unless self.squares[[coords.first + 2, coords.last - 1]].nil?
        add_edges(coords, [coords.first + 1, coords.last + 2]) unless self.squares[[coords.first + 1, coords.last + 2]].nil?
        add_edges(coords, [coords.first + 1, coords.last - 2]) unless self.squares[[coords.first + 1, coords.last - 2]].nil?
        add_edges(coords, [coords.first - 1, coords.last + 2]) unless self.squares[[coords.first - 1, coords.last + 2]].nil?
        add_edges(coords, [coords.first - 1, coords.last - 2]) unless self.squares[[coords.first - 1, coords.last - 2]].nil?
        add_edges(coords, [coords.first - 2, coords.last + 1]) unless self.squares[[coords.first - 2, coords.last + 1]].nil?
        add_edges(coords, [coords.first - 2, coords.last - 1]) unless self.squares[[coords.first - 2, coords.last - 1]].nil?
      end
    end
  end


  def knight_moves(start_coords, end_coords, parent = {}, visited = [], to_visit = [], dist = {})
    # parent keeps track of previous nodes (vertices)
    # to_visit is the queue
    # visited is the array to store visited nodes
    # I also need a collection for the edge numbers
    start_node = self.squares[start_coords]
    visited << start_node
    to_visit << start_node
    parent[start_node.coords] = start_node
    dist[start_node.coords] = 0
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
    path = []
    destination = self.squares[end_coords]
    path << destination
    while parent[destination.coords] != start_node
      path << parent[destination.coords]
      destination = parent[destination.coords]
    end
    path << start_node
    # outputting results
    puts %(Achieved with #{dist[end_coords]} move(s), from #{start_coords} to #{end_coords}:)
    path.size.downto(0) do |n|
      p path[n].coords unless path[n].nil?
    end
  end
end
