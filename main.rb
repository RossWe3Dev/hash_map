require_relative "lib/hash_map"

test = HashMap.new

test.set("apple", "red")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("lion", "golden")

puts "\nTesting #get(key)"
p test.get("lion")

puts "\nTesting #has?(key)"
p test.has?("dog")
p test.has?("cat")

puts "\nTesting #keys"
p test.keys
puts "\nTesting #values"
p test.values
puts "\nTesting #entries"
p test.entries

puts "\nTesting if #set updates existing key's value"
test.set("dog", "black")
p test.entries

puts "\nTesting #remove(key)"
p test.remove("dog")
p test.has?("dog")

puts "\nTesting #length = #{test.length}"

puts "\nTesting max capacity = #{test.capacity_check}"

puts "\nReaching 12 elements"
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
puts "Hash Map contains #{test.length} elements"
puts "Hash Map currently has #{test.buckets.length} buckets"

puts "\nAdding 13th element"
test.set("moon", "silver")
p test.entries
puts "Hash Map now contains #{test.length} elements"
puts "Hash Map currently has #{test.buckets.length} buckets"

puts "\nTesting #clear"
test.clear
puts "Length after #clear = #{test.length}"
