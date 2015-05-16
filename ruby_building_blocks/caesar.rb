# Ruby building blocks, first project of Ruby programming course from odin_project
# Matias Pan - https://github.com/kriox26/
#
#Implement this two methods for checking if a character is lower or upper case
  def is_upper?(c)
    return c == c.capitalize
  end
  def is_lower?(c)
    return c != c.capitalize
  end
# Check if current char is a letter
  def letter?(lookAhead)
    lookAhead =~ /[A-Za-z]/
  end
# Function for doing the shift of a letter
  def parse_letter(from_where, letter, key)
    # Check if you go from Z to A or z to a
    return (letter.ord + key > from_where)?((letter.ord + key - 26).chr):((letter.ord + key).chr)
  end

# Get from the command line the encryption key
key = ARGV.first
key = key.to_i
# check for the size of the key
if key > 26
  key = key % 26
end
#Get string from user
print "String to encrypt: "
string = STDIN.gets.chomp()
string.length().times do |i|
  # If is not a letter then we dont shift 
  if letter?(string[i])
    if is_upper?(string[i])
      # call to parse_letter with upcase, we do this to mantain their case
      string[i] = parse_letter(90, string[i], key)
    else
      # same thing but with lower case
      string[i] = parse_letter(122, string[i], key)
    end
  end 
end
# Print the encrypted string
puts string
