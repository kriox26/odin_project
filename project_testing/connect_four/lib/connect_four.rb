class ConnectFour
  PLAYERS = [:green , :yellow]

  attr_accessor :p_playing, :board

  def initialize
	@board = Board.new
	@p_playing = PLAYERS.first
  end

  def start
	puts "Welcome to Connect Four game!"
  end
end
