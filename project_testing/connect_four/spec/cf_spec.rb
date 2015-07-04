=begin
  Connect four RSpecs
=end

describe ConnectFour do
  let(:game) { ConnectFour.new }
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

  context "#play" do

	it "" do
	end

	it "" do
	end

  end

end
