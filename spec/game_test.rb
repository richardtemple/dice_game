require 'minitest/autorun'
require_relative '../game'

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

  def test_get_input_to_roll

  end

  def test_roll_dice
    @game.roll_dice
    assert @game.current_dice.count == 6
  end

  def test_read_user_input
    with_stdin do |user|
      user.puts "user input"
      assert_equal(@game.read_user_input, "user input")
    end
  end

  def with_stdin
    stdin = $stdin             # remember $stdin
    $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
    yield write                # pass pipe's "write end" to block
  ensure
    write.close                # close pipe
    $stdin = stdin             # restore $stdin
  end
end