require_relative "node"

# Copied custom implementation of Linked Lists from previous project
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def last_node?(node)
    return true if node.next_node.nil?

    false
  end

  def tail(current_node = @head)
    current_node = current_node.next_node until last_node?(current_node)
    current_node
  end

  def append(value)
    entry = Node.new(value)
    if @head.nil?
      @head = entry
    else
      tail.next_node = entry
    end
  end

  def prepend(value)
    entry = Node.new(value, @head)
    @head = entry
  end

  def size
    return 0 if @head.nil?

    current_node = @head
    counter = 1

    until last_node?(current_node)
      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def at(index)
    return nil if index > size

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return nil if size < 1

    current_node = @head
    current_node = current_node.next_node until current_node.next_node == tail

    current_node.next_node = nil
  end

  def contains?(value)
    current_node = @head
    until current_node.next_node == tail
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value, index = 0, current_node = @head)
    begin
      until current_node.value == value
        current_node = current_node.next_node
        index += 1
      end
    rescue StandardError
      return puts "#{value} is not in the list"
    end

    puts "#{value} is at index: #{index}"
  end

  def to_s
    current_node = @head
    string = ""
    until last_node?(current_node)
      string += "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    string + "(#{tail.value}) -> nil"
  end

  def insert_at(value, index)
    node_at_current_index = at(index)
    entry = Node.new(value, node_at_current_index)
    if index.zero?
      @head = entry
    elsif index > size
      puts "Cannot insert at an index > than the list's current length"
    else
      previous_node = at(index - 1)
      previous_node.next_node = entry
    end
  end

  def remove_at(index)
    node_at_current_index = at(index)
    if index.zero?
      @head = node_at_current_index.next_node
    elsif index >= size
      puts "There are no items at index: #{index}"
    else
      previous_node = at(index - 1)
      previous_node.next_node = node_at_current_index.next_node
    end
  end
end
