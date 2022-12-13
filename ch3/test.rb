# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Test func function
class TestFunc < MiniTest::Test
  def setup
    @num = 9999
  end

  # Ожидаемые значения при соответствующих параметрах (начало a_start и конец отрезка b_end,
  # количество отрезков разбиения num)
  # взяты с сайта https://math24.biz/integral_trapezoid

  def test_func_input_error
    assert_raises(ArgumentError) { Main.integrate_func1_through_trap_lambda(0) }
    assert_raises(ArgumentError) { Main.integrate_func1_through_trap_block(-5) }
    assert_raises(ArgumentError) { Main.integrate_func2_through_trap_lambda(-999_999) }
    assert_raises(ArgumentError) { Main.integrate_func2_through_trap_block(-Float::INFINITY) }
  end

  def test_func1_through_trap_lambda
    assert_in_delta 7.584668487735689, Main.integrate_func1_through_trap_lambda(@num), 0.000001
  end

  def test_func1_through_trap_block
    assert_in_delta 7.584668487735689, Main.integrate_func1_through_trap_block(@num), 0.000001
  end

  def test_func1_through_both_lambda_block
    assert_equal Main.integrate_func1_through_trap_block(@num), Main.integrate_func1_through_trap_lambda(@num)
  end

  def test_func2_through_trap_lambda
    assert_in_delta(-1.201396442224962, Main.integrate_func2_through_trap_lambda(@num), 0.000001)
  end

  def test_func2_through_trap_block
    assert_in_delta(-1.201396442224962, Main.integrate_func2_through_trap_block(@num), 0.000001)
  end

  def test_func2_through_both_lambda_block
    assert_equal Main.integrate_func2_through_trap_block(@num), Main.integrate_func2_through_trap_lambda(@num)
  end
end
