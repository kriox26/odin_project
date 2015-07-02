require "./lib/tic_tac_toe"


describe TicTacToe do
  let(:tictactoe) { TicTacToe.new }
  before(:example) do
	allow(tictactoe).to receive(:puts)
	allow(tictactoe).to receive(:print)
	allow(tictactoe).to receive(:gets)
  end

  describe "#create_grid_and_players" do
	it "puts the welcome message" do
	  expect(tictactoe).to receive(:puts).with("Welcome to Tic Tac Toe!")
	  tictactoe.create_grid_and_players
	end
	it "sets the player 1 to X and player two to O" do
	  tictactoe.create_grid_and_players
	  expect(tictactoe.player1.mark).to eq("X")
	  expect(tictactoe.player2.mark).to eq("O")
	end
  end
end
