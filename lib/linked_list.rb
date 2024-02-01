require_relative 'board_node.rb'

class LinkedList

  attr_accessor :root

  def initialize(root = nil)
    self.root = root
  end

  def append(value)
    if self.root.nil?
      self.prepend(value)
    else
      tmp = self.root
      until tmp.next_square.nil?
        tmp = tmp.next_square
      end
      tmp.next_square = BoardNode.new(value)
    end
  end

  def prepend(value = nil)
    self.root.nil? ? self.root = BoardNode.new(value) : self.root = BoardNode.new(value, self.root)
  end

  def size
    return 0 if self.root.nil?
    count = 1
    temp = self.root
    until temp.next_square.nil?
      temp = temp.next_square
      count += 1
    end
    count
  end

  def head
    return if self.root.nil?
    temp = self.root
    return BoardNode.new(nil, temp.value)
  end

  def tail
    return if self.root.nil?
    temp = self.root
    until temp.next_square.nil?
      temp = temp.next_square
    end
    temp
  end

  def at(index)
    temp = self.root
    until temp.next_square.nil?
      return temp.value if self.find(temp.value) == index
      temp = temp.next_square
    end
  end

  def pop
    key = self.tail.value
    return if self.root.nil?
    self.root = self.root.next_square if self.root.value == key
    current = self.root
    while !current.nil? && current.value != key
      previous = current
      current = current.next_square
    end
    current.nil? ? return : previous.next_square = current.next_square
  end

  def contains?(value)
    temp = self.root
    until temp.nil?
      return true if temp.value == value
      temp = temp.next_square
    end
    false
  end

  def find(value)
    return 0 if self.root.value == value
    idx_count = 0
    temp = self.root
    until temp.next_square.nil?
      temp = temp.next_square
      idx_count += 1
      return idx_count if temp.value == value
    end
  end

  def to_s
    return '' if self.root.nil?
    temp = self.root
    str_ver = ''
    while !temp.next_square.nil?
      str_ver += %(( #{temp.column_num} ) -> )
      temp = temp.next_square
    end
    str_ver += %(( #{temp.column_num} ) -> )
  end

  # TODO: implement the #insert_at and #remove_at method for extra credit
  def insert_at(value, index)
    self.prepend(value) if index == 0
    count = 0
    curr = self.root
    while !curr.nil?
      prev = curr
      curr = curr.next_square
      count += 1
      if count == index
        to_insert = BoardNode.new(nil, value, curr)
        prev.next_square = to_insert
      end
    end
  end

  def remove_at(index)
    self.root = self.root.next_square if index == 0
    count = 0
    current = self.root
    while !current.nil?
      prev = current
      current = current.next_square
      count += 1
      return prev.next_square = current.next_square if count == index
    end
  end
end
