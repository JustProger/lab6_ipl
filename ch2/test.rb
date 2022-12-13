# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../ch1/main'
require_relative 'main'

# Test func function
class TestFunc < MiniTest::Test
  def setup
    @eps1 = 1
    @eps2 = 2
  end

  def test_func_errors
    assert_raises(ArgumentError) { Main.func_ch2(3) }
    assert_raises(ArgumentError) { Main.func_ch2(1.5) }
    assert_raises(ArgumentError) { Main.func_ch2(1.1) }
    assert_raises(ArgumentError) { Main.func_ch2(0) }
    assert_raises(ArgumentError) { Main.func_ch2(-50) }
    assert_raises(ArgumentError) { Main.func_ch2(Float::INFINITY) }
  end

  def test_func
    assert_in_delta 0.968, Main.func_ch2(@eps1)[0], 0.001
    assert_equal 31, Main.func_ch2(@eps1)[1]
    assert_in_delta 0.989, Main.func_ch2(@eps2)[0], 0.001
    assert_equal 99, Main.func_ch2(@eps2)[1]
  end

  # :'../ch1/main'::
  def test_methods
    assert_in_delta Main1.func(@eps1)[0], Main.func_ch2(@eps1)[0], 0.001
    assert_equal Main1.func(@eps1)[1], Main.func_ch2(@eps1)[1]
    assert_in_delta Main1.func(@eps2)[0], Main.func_ch2(@eps2)[0], 0.001
    assert_equal Main1.func(@eps2)[1], Main.func_ch2(@eps2)[1]
  end
end
