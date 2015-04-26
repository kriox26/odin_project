def echo(word)
  word
end

def shout(word)
  word.upcase!
end

def repeat(word,rep = 2)
  printing = (word << " ") * rep
  printing.chop
end

def start_of_word(word,rep)
  word[0,rep]
end

def first_word(word)
  print = word.split.first
  print
end

def titleize(sentence)
  sentence = sentence.split(" ")
  title = sentence[0].capitalize
  sentence[1..-1].each do |word|
    if word.downcase == 'and' || word.downcase == 'the' || word.downcase == 'over'
      title += ' ' + word
    else
      title += ' ' + word.capitalize
    end
  end
  title
end
