#require "byebug"
require_relative "board"
require_relative "player"

class Game
  def initialize(filename, name = "Test-Guy")
    @board = Board.new(filename)
    @player = Player.new(name)
  end

  def game_over?
    @board.all_revealed? || @board.bomb_present?
  end

  def play
    #byebug
    until game_over?
      @board.render
      pos = @player.get_position
      command = @player.get_command
      @board[*pos] = command
    end
    puts "you win"
  end
end
