#ai_player, name is random 
class PlayerAI < Player
  attr_writer :last_rating
  def initialize
	reset_values
	@name = AI_NAMES.sample
	@score = 0
  end

  def human?
	false
  end

  # Keep track of what type of player is
  def ai?
	true
  end

  # Keep track of last rating to eliminate combinations from set of codes
  def update_rating_and_codes(rating)
	@last_rating = rating
	update_set_of_codes
  end

  # Make guess handles first guess and any other guess
  def make_guess
	puts "#{ @name  } is thinking..."
	if @first_guess==[]
	  return make_first_guess
	else
	  # update the last guess, get a random sample from the set of available codes
	  sleep 1
	  @last_guess = @set_of_codes.sample 
	  return @last_guess
	end
  end

  def reset_values
	@first_guess = []
	@last_guess = []
	@last_rating = []
	@set_of_codes = []
	possible_codes
  end

  private
  # Generate all 1296 possible secret codes
  def possible_codes
	(0..5).each do |first|
	  (0..5).each do |second|
		(0..5).each do |third|
		  (0..5).each do |fourth|
			@set_of_codes << [COLORS[first],COLORS[second],COLORS[third],COLORS[fourth]]
		  end
		end
	  end
	end
  end

  # remove from set of codes any code that would not give the same response if it (the guess) were the code
  def update_set_of_codes
	@set_of_codes.select! do |selected_code|
	  number_of_wb(rate_guess(selected_code,@last_guess,true)) == number_of_wb(@last_rating)
	end
  end

  # When the guess is the first one, we need to choose something like red,red,blue,blue
  def make_first_guess
	first_rand = :default
	second_rand = :default
	loop do
	  first_rand = COLORS[rand(6)]
	  second_rand = COLORS[rand(6)]
	  break if first_rand != second_rand
	end
	@first_guess = [first_rand,first_rand,second_rand,second_rand]
	sleep 1
	@last_guess = @first_guess
	return @first_guess
  end

end
