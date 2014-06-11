gem 'minitest'
require 'minitest/autorun'
require 'sanity'

class SanityTest < Minitest::Test
  def test_it_works
    assert_equal 42, Sanity.new(42).answer
  end
end
