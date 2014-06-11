require_relative '../../test_helper'
require_relative '../lib/checkerboard'

class CheckerboardTest < Minitest::Test
  def test_small_board
    expected = <<-BOARD
B W
W B
BOARD
    assert_equal expected, Checkerboard.new(2).to_s
  end

  def test_bigger_board
    skip
    expected = <<-BOARD
B W B
W B W
B W B
BOARD
    assert_equal expected, Checkerboard.new(3).to_s
  end

  def test_chess_board
    skip
    expected = <<-BOARD
B W B W B W B W
W B W B W B W B
B W B W B W B W
W B W B W B W B
B W B W B W B W
W B W B W B W B
B W B W B W B W
W B W B W B W B
BOARD
    assert_equal expected, Checkerboard.new(8).to_s
  end
end
