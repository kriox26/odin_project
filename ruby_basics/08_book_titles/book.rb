class Book
  def title=(title)
    array = title.split(' ')
    array.each do |x|
      unless ["the","a","an","and","in","of",].include?(x)
        x.capitalize!
      end
    end
    if array.size > 0
      array[0].capitalize!
    end
    @title = array.join(" ")
  end

  def title
    @title
  end
end
