require_relative "lib/hash_map"

test = HashMap.new

test.set("apple", "red")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("lion", "golden")

p test.get("lion")
p test.has?("dog")
p test.remove("dog")
p test.has?("dog")
p test.length
p test.clear
p test.length
