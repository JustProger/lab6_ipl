# frozen_string_literal: true

require_relative 'main'

puts 'Точность и его номер:'
puts '1) 10^(-3)'
puts '2) 10^(-4)'
puts 'Введите номер точности вычисления (1 или 2):'
x = gets.chomp.to_i
puts 'Результат:'
puts "Сумма ряда - #{Main.func(x)[0]}"
puts "Количество итераций - #{Main.func(x)[1]}"
p "Разность количества итераций - #{Main.func(2)[1] - Main.func(1)[1]}"
