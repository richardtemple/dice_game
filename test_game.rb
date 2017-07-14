require 'minitest/autorun'
require './game'

class TestGame < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_game_exists
    assert @game != nil
  end

  def test_game_starts

    out, err = capture_io do
      @game.start
    end

    assert out.include? "Welcome to the game!"
    assert_equal "", err
  end
end