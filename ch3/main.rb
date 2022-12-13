# frozen_string_literal: true

# Description of Main
class Main
  @integr1_a = -1.0
  @integr1_b = 4.0

  @integr2_a = 0
  @integr2_b = 2

  def self.check_input(num)
    raise ArgumentError unless num.positive?
  end

  def self.func1(arg)
    arg.to_f + Math.cos(arg)
  end

  def self.func2(arg)
    Math.tan(arg + 1.0) / (arg + 1.0)
  end

  def self.trap_lambda(func, a_start, b_end, num)
    first = (func.call(a_start) + func.call(b_end)) / 2.0
    h_num = (b_end - a_start) / num.to_f
    (first + (1...num).sum { |arg| func.call(a_start + h_num * arg) }) * h_num
    # Метод средних прямоугольников
    # result = 0
    # for i in (0..(num - 1)) do
    #   result += func.call(a_start + h_num/2 + i * h_num)
    # end
    # result *= h_num
    # [my_result, result]
  end

  def self.trap_block(a_start, b_end, num)
    first = (yield(a_start) + yield(b_end)) / 2.0
    h_num = (b_end - a_start) / num.to_f
    (first + (1...num).sum { |arg| yield(a_start + h_num * arg) }) * h_num
  end

  def self.integrate_func1_through_trap_lambda(num)
    check_input(num)
    f_l = method(:func1).to_proc
    trap_lambda(f_l, @integr1_a, @integr1_b, num)
  end

  def self.integrate_func1_through_trap_block(num)
    check_input(num)
    f_l = method(:func1).to_proc
    trap_block(@integr1_a, @integr1_b, num, &f_l)
  end

  def self.integrate_func2_through_trap_lambda(num)
    check_input(num)
    f_l = method(:func2).to_proc
    trap_lambda(f_l, @integr2_a, @integr2_b, num)
  end

  def self.integrate_func2_through_trap_block(num)
    check_input(num)
    f_l = method(:func2).to_proc
    trap_block(@integr2_a, @integr2_b, num, &f_l)
  end
end
