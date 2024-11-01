require_relative "lib/hash_map"

test = HashMap.new

test.set("apple", "red")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("lion", "golden")

p test.get("lion")
puts "\nTesting #has?(key)"
p test.has?("dog")
p test.has?("cat")
puts "\nTesting #remove(key)"
p test.remove("dog")
p test.has?("dog")
puts "\nTesting #length"
p test.length
puts "\nTesting #clear"
test.clear
print "Length after #clear = "
p test.length
