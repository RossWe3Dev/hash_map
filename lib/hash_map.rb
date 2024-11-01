require_relative "linked_list"

# Custom HashMap implementation, starting size = 16 buckets, default load factor = 0.75
class HashMap
  attr_accessor :buckets, :load_factor

  def initialize(load_factor = 0.75)
    @buckets = Array.new(16, nil)
    @load_factor = load_factor
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def capacity_check
    @buckets.length * @load_factor
  end

  def set(key, value)
    resize if length >= capacity_check

    bucket_index = hash(key) % @buckets.length

    @buckets[bucket_index] ||= LinkedList.new # Create new LL if empty
    if @buckets[bucket_index].contains?(key)
      @buckets[bucket_index].update_value(key, value)
    else
      @buckets[bucket_index].append(key, value)
    end
  end

  def resize
    new_size = @buckets.length * 2
    new_buckets = Array.new(new_size, nil)

    @buckets.each do |list|
      next if list.nil?

      current_node = list.head
      while current_node
        new_index = hash(current_node.key) % new_size
        new_buckets[new_index] ||= LinkedList.new
        new_buckets[new_index].append(current_node.key, current_node.value)
        current_node = current_node.next_node
      end
    end

    @buckets = new_buckets
  end

  def get(key)
    bucket_index = hash(key) % @buckets.length
    return puts "Key: '#{key}' is not in the hash" unless @buckets[bucket_index]

    @buckets[bucket_index].find(key)
  end

  def has?(key)
    bucket_index = hash(key) % @buckets.length
    return @buckets[bucket_index].contains?(key) unless @buckets[bucket_index].nil?

    false
  end

  def remove(key)
    bucket_index = hash(key) % @buckets.length
    return puts "Key: '#{key}' is not in the hash" unless @buckets[bucket_index]

    index_to_remove = @buckets[bucket_index].find_index(key)
    @buckets[bucket_index].remove_at(index_to_remove)
  end

  def length
    count = 0
    @buckets.each do |list|
      count += list.size unless list.nil?
    end
    count
  end

  def clear
    @buckets.each_index { |i| @buckets[i] = nil }
  end

  def keys
    keys_array = []
    @buckets.each do |list|
      next if list.nil?

      current_node = list.head
      while current_node
        keys_array << current_node.key
        current_node = current_node.next_node
      end
    end
    keys_array
  end

  def values
    values_array = []
    @buckets.each do |list|
      next if list.nil?

      current_node = list.head
      while current_node
        values_array << current_node.value
        current_node = current_node.next_node
      end
    end
    values_array
  end

  def entries
    entries_array = []
    @buckets.each do |list|
      next if list.nil?

      current_node = list.head
      while current_node
        entries_array << [current_node.key, current_node.value]
        current_node = current_node.next_node
      end
    end
    entries_array
  end
end
