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

puts "\nTesting #length"
p test.length

puts "\nTesting #clear"
test.clear
print "Length after #clear = "
p test.length
