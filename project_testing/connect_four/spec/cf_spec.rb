=begin
  Connect four RSpecs
=end

describe ConnectFour do
  let(:game) { ConnectFour.new }
  let(:p1) { ConnectFour::PLAYERS.first }
  let(:p2) { ConnectFour::PLAYERS.last }

  before(:example) do
	allow(game).to receive(:puts)
	allow(game).to receive(:print)
  end

  context "#new" do

	it "checks instace of game" do
	  expect(game).to be_an_instance_of ConnectFour
	end

	it "initialize board and current player" do
	  expect(game.p_playing).to eq :green
	  expect(game.board).to be_an_instance_of Board
	end

  end

  context "#start" do

	it "welcomes you to the game" do
	  expect(game).to receive(:puts).with "Welcome to Connect Four game!"
	  game.start
	end

  end

  context "#user_input" do
	before(:example) do
	  allow(game).to receive(:gets).and_return("",'',"10")
	end

	it "rejects empty input" do
	  expect(game.user_input).to eq("10")
	end

	it "accepts a non empty input" do
	  expect(game.user_input).to eq("10")
	end
  end

  context "#correct_input?" do

	it "rejects invalid input" do
	  expect(game.correct_input?(-2)).to be false
	  expect(game.correct_input?("hello")).to be false
	end

	it "accepts valid positions" do
	  expect(game.correct_input?(5)).to be true
	end

  end

  context "#get_move" do
	before(:example) do
	  allow(game).to receive(:user_input).and_return("input", 0, 21, 3)
	end

	it "rejects invalid move" do
	  expect(game.get_move).to eq(2)
	end

	it "accepts valid move" do
	  expect(game.get_move).to eq(2)
	end

  end

  context "#switch_player" do

	it "switches from player 1 to player 2" do
	  expect(game.p_playing).to eq(p1)
	  game.switch_player
	  expect(game.p_playing).to eq(p2)
	end

	it "switches from player 2 to player 1" do
	  game.switch_player
	  expect(game.p_playing).to eq(p2)
	  game.switch_player
	  expect(game.p_playing).to eq(p1)
	end
  end

end
