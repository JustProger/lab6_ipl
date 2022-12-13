# frozen_string_literal: true

# Description of Main
class Main
  def self.check_input(precision_id)
    case precision_id
    when 1
      1.0 / (10**3)
    when 2
      1.0 / (10**4)
    else
      raise ArgumentError, 'Вводимое значение 1 или 2!!!'
    end
  end

  def self.process_k_iteration(k_iteration)
    1 / (k_iteration * (k_iteration + 1.0))
  end

  def self.func_ch2(precision_id)
    eps = check_input(precision_id)
    sum1 = 0
    sum2 = process_k_iteration(1)
    (2..Float::INFINITY).lazy.collect do |n|
      sum1 = sum2
      sum2 += process_k_iteration(n)
      [sum2, n]
    end.take_while { |_res| sum2 - sum1 >= eps }.inject { |_acc, n| n }
  end
end
