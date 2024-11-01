require_relative "linked_list"

# Implementation of custom HashMap, initializing array of 16 empty buckets
class HashMap
  attr_reader :hash_map, :load_factor

  def initialize(load_factor = 0.75)
    @hash_map = Array.new(16, nil)
    @load_factor = load_factor
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value)
    bucket = hash(key) % 16
    @hash_map[bucket] = LinkedList.new
    @hash_map[bucket].append(value)
  end

  def get(key)
    bucket = hash(key) % 16
    return nil if @hash_map[bucket].nil?

    @hash_map[bucket] # returns the whole Linked list, todo: return the wanted value only
  end
end
