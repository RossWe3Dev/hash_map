require_relative "node"

# Custom Linked Lists that stores key-value pairs
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

  def append(key, value)
    entry = Node.new(key, value)
    if @head.nil?
      @head = entry
    else
      tail.next_node = entry
    end
  end

  def contains?(key)
    current_node = @head
    until current_node.next_node == tail
      return true if current_node.key == key

      current_node = current_node.next_node
    end
    false
  end

  def find(key)
    current_node = @head

    while current_node
      return current_node.value if current_node.key == key

      current_node = current_node.next_node
    end

    nil
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

  def find_index(key)
    current_node = @head
    index = 0

    while current_node
      return index if current_node.key == key

      current_node = current_node.next_node
      index += 1
    end

    nil
  end

  def at(index)
    return nil if index > size

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def insert(index, key, value)
    return nil if index.negative? || index > size # return nil to handle errors in HashMap class

    node_to_shift = at(index)
    entry = Node.new(key, value, node_to_shift)

    if index.zero?
      entry.next_node = @head
      @head = entry
    else
      previous_node = at(index - 1)
      previous_node.next_node = entry
    end
  end

  def remove_at(index)
    return nil if index.negative? || index >= size # return nil to handle errors in HashMap class

    removed_node = at(index)
    if index.zero?
      @head = removed_node.next_node
    else
      previous_node = at(index - 1)
      previous_node.next_node = removed_node.next_node
    end
    removed_node.value
  end
end
