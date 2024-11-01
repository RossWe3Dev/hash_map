require_relative "linked_list"

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

  def set(key, value)
    bucket_index = hash(key) % 16

    @buckets[bucket_index] ||= LinkedList.new # Create new LL if empty
    if @buckets[bucket_index].contains?(key)
      @buckets[bucket_index].update_value(key, value)
    else
      @buckets[bucket_index].append(key, value)
    end
  end

  def get(key)
    bucket_index = hash(key) % 16
    return nil unless @buckets[bucket_index] # returns nil for now, will handle errors later

    @buckets[bucket_index].find(key)
  end

  def has?(key)
    bucket_index = hash(key) % 16
    return @buckets[bucket_index].contains?(key) unless @buckets[bucket_index].nil?

    false
  end

  def remove(key)
    bucket_index = hash(key) % 16
    return nil unless @buckets[bucket_index] # returns nil for now, will handle errors later

    index_to_remove = @buckets[bucket_index].find_index(key)
    return nil if index_to_remove.nil? # returns nil for now, will handle errors later

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
end
