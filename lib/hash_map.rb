# Implementation of custom HashMap, starting size 16
class HashMap
  attr_reader :hash_map, :load_factor

  def initialize(load_factor)
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
    @hash_map[bucket] = value
  end
end
