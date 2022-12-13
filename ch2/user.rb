# frozen_string_literal: true

require_relative 'main'

puts 'Точность и его номер:'
puts '1) 10^(-3)'
puts '2) 10^(-4)'
puts 'Введите номер точности вычисления (1 или 2):'
x = gets.chomp.to_i
puts 'Результат:'
puts "Сумма ряда - #{Main.func_ch2(x)[0]}"
puts "Количество итераций - #{Main.func_ch2(x)[1]}"
p "Разность количества итераций - #{Main.func_ch2(2)[1] - Main.func_ch2(1)[1]}"
