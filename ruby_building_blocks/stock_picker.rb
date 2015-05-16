print 'Days to buy and sell: '
days = gets.chomp().to_i
stocks = Array.new
days.times do |i|
  puts "Stock for day #{i}: "
  # get stock on day i from user
  stocks[i] = gets.chomp().to_i
end

# use max for checking the best combination
max = -1
# result is where the days corresponding to our best choice will be
result = Array.new
# i use two loops for maintaining order of first buy and then sell
days.times do |i|
  if i != days
    for j in (i+1)..(days-1)
      if (stocks[j] - stocks[i]) > max
        # If we find a better combination, update max
        max = stocks[j] - stocks[i]
        # and update the days que return
        result[0]=i
        result[1]=j
      end
    end
  end
end

p result
