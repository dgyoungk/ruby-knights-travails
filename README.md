## TOP FS Ruby DSA Project: Knights Travails

A rough representation of an unweighted, undirected Graph created from Node objects
    - meant to resemble a chess board

## Classes and Methods:

### Node class:
    - represents each square on the chess board
    - attributes:
        - coords: an array containing the coordinates of the square e.g. [0,1]
        - neighbours: an array housing other Node objects that are adjacent
    - methods:
        - #add_vertex: adds an adjancent Node object to the neighbours array

### Knight class:
    - represents the Knight chess piece
    - attributes: 
        - possible_moves: an array of move combinations that a Knight can do

### Board class:
    - represents the chess board (Graph Data Structure)
    - attributes: 
        - squares: a hash containing all the squares on the board
        - coordinates: an 2d array of all the coordinates on an 8x8 chess board
    - methods:
        - #add_node: assigns the Node object in the Graph using the coordinates as the key
        - #add_edges: takes in 2 Node objects and assigns edges to each other
        - #build_graph: builds the Graph of Node objects from the provided coordinates
        - #graph_edges: adds all adjacent Nodes for each square on the board
        - #knight_moves(start_coords, end_coords): 
            outputs the shortest path from the Node with start_coords to the Node with end_coords
    

Author: Daniel Kwon 2024
