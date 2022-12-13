# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Test func function
class TestFunc < MiniTest::Test
  def setup
    @eps1 = 1
    @eps2 = 2
  end

  def test_func_errors
    assert_raises(ArgumentError) { Main1.func(3) }
    assert_raises(ArgumentError) { Main1.func(1.5) }
    assert_raises(ArgumentError) { Main1.func(1.1) }
    assert_raises(ArgumentError) { Main1.func(0) }
    assert_raises(ArgumentError) { Main1.func(-50) }
    assert_raises(ArgumentError) { Main1.func(Float::INFINITY) }
  end

  def test_func
    assert_in_delta 0.968, Main1.func(@eps1)[0], 0.001
    assert_equal 31, Main1.func(@eps1)[1]
    assert_in_delta 0.989, Main1.func(@eps2)[0], 0.001
    assert_equal 99, Main1.func(@eps2)[1]
  end
end
