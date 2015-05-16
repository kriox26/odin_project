print "Length of dictionary? "
words = gets.chomp().to_i
dictionary = Array.new
words.times do |i|
  print "Word #{i}: "
  dictionary[i] = gets.chomp()
end

def substrings(substr, dict)
  result = Hash.new
  dict.length().times do |i|
    # check occurrences for the i'th word of the dictionary
    if substr.scan(dict[i]).length > 0
      # update the hash if we found occurrences
      result[dict[i]] = substr.scan(dict[i]).length
    end
  end
  return result
end

puts "Input the text: "
substr = gets.chomp()
# send the downcase of substr
final_hash = substrings(substr.downcase, dictionary)
p final_hash

