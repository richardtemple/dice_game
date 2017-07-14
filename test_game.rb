require 'minitest/autorun'
require './game'

class TestGame < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_game_exists
    assert @game != nil
  end
end