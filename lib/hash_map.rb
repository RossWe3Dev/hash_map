require_relative "linked_list"

class HashMap
  attr_reader :hash_map, :load_factor

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

  def set(key, value)
    bucket_index = hash(key) % 16
    list = @buckets[bucket_index]

    list ||= LinkedList.new # Create new LL if empty
    list.append(key, value)
  end

  def get(key)
    bucket_index = hash(key) % 16
    list = @buckets[bucket_index]
    return nil unless list # returns nil for now, will handle errors later

    list.find(key)
  end

  def has?(key)
    bucket_index = hash(key) % 16
    list = @buckets[bucket_index]

    return list.contains?(key) unless list.nil?

    false
  end

  def remove(key)
    bucket_index = hash(key) % 16
    list = @buckets[bucket_index]
    return nil unless list # returns nil for now, will handle errors later

    index_to_remove = list.find_index(key)
    return nil if index_to_remove.nil? # returns nil for now, will handle errors later

    list.remove_at(index_to_remove)
  end
end
