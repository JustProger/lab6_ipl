# frozen_string_literal: true

require_relative 'main'

puts 'Число отрезков разбиения (>0, целое):'
x = gets.chomp.to_i
unless x.positive?
  puts 'Число должно быть >0!'
  exit
end
puts 'Результат:'
puts "Сумма интеграла 1 через trap_lambda - #{Main.integrate_func1_through_trap_lambda(x)}"
puts "Сумма интеграла 1 через trap_block- #{Main.integrate_func1_through_trap_block(x)}"
puts "Сумма интеграла 2 через trap_lambda - #{Main.integrate_func2_through_trap_lambda(x)}"
puts "Сумма интеграла 2 через trap_block- #{Main.integrate_func2_through_trap_block(x)}"
