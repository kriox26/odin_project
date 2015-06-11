require 'jumpstart_auth'
require 'bitly'

Bitly.use_api_version_3

class MicroBlogger
  attr_reader :client

  def initialize
	puts "Initializing MicroBlogger"
	@client = JumpstartAuth.twitter
  end

  def tweet(message)
	if message.length <= 140
	  @client.update(message)
	else
	  puts "Tweet is too long!"
	end
  end
  def followers_list
	screen_names = []
	@client.followers.each { |follower| screen_names << @client.user(follower).screen_name }
	return screen_names
  end

  def spam_followers(message)
    followers = followers_list
	followers.each do |follower|
	  dm(follower, message)
	end
  end

  def run
    puts "Welcome to JSL Twitter Client!"
	command = ""
	while command != "q"
	  print "Enter command: "
	  input = gets.chomp
	  parts = input.split(" ")
	  command = parts[0]
	  case command
	  when "q" then puts "Goodybye!"
	  when "t" then tweet(parts[1..-1].join(" "))
	  when "spam" then spam_followers(parts[1..-1].join(" "))
	  when "dm" then dm(parts[1], parts[2..-1].join(" "))
	  when "elt" then everyones_last_tweet
	  when "s" then shorten(parts[-1])
	  when "turl" then tweet(parts[1..-2].join(' ') + ' ' + shorten(parts[-1]))
	  else
		puts "I don't know how to #{command}"
	  end
	end
  end

  def shorten(original_url)
    puts "Shortening this url #{original_url}"
	bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
	return bitly.shorten(original_url).short_url
  end

  def dm(target,message)
	screen_names = followers_list
	if !screen_names.include?(target)
	  puts "You can only send messages to users that follow you!"
	  return
	end
	puts "Trying to send #{ target } this direct message."
	puts message
	message = "d @#{target} #{message}"
	tweet(message)
  end

  def everyones_last_tweet
	friends = @client.friends.sort_by { |friend| @client.user(friend).screen_name.downcase }
	friends.each do |friend|
	  timestamp = @client.user(friend).status.created_at
	  timestamp = timestamp.strftime("%A, %b %d")
	  puts "#{ @client.user(friend).screen_name} said this on #{timestamp}"		# find each friends last message
	  puts "#{ @client.user(friend).status.text }"				# print each friends screen_name
	  puts "" 													# just to separate with a blank line each user
	end
  end

end

blogger = MicroBlogger.new
blogger.run
