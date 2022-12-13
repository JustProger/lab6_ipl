# frozen_string_literal: true

# Description of Main
class Main1
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

  def self.func(precision_id)
    eps = check_input(precision_id)
    k_iter = 1
    sum1 = 0
    sum2 = process_k_iteration(k_iter)
    loop do
      return [sum1, k_iter - 1] unless sum2 - sum1 >= eps

      k_iter += 1
      sum1 = sum2
      sum2 += process_k_iteration(k_iter)
    end
  end
end
