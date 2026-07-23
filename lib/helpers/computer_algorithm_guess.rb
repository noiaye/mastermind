# frozen_string_literal: true

require 'pry-byebug'
computer_guess = %w[red red purple yellow]
player_creation = %w[red red green blue]

# Some helper functions for the computer_guesser
# module ComputerAlgorithm
def exact_values(computer_guess, player_creation)
  binding.pry
  filter_array = []
  algorithm_array = []
  p 'hi'
  computer_guess.each_with_index do |v, i|
    player_creation.each_with_index do |x, y|
      next unless v == x && i == y

      p 'e'
      break if both_qualified(computer_guess, player_creation, filter_array) == false

      p '2'

      algorithm_array[i] = 1
      filter_array.push([i, y])
    end
  end
  [filter_array, algorithm_array]
end

# def computer_guess_qualified(computer_guess, filter_array)
#   computer_guess.each_with_index do |_v, i|
#     break if filter_array.any? { |v| v[0] == i }

#     p 'true'
#     true
#   end
#   false
# end
def both_qualified(computer_guess, player_creation, filter_array)
  computer_guess.each_with_index do |v, i|
    player_creation.each_with_index do |x, y|
      next unless v == x
      break if filter_array.any? { |v1| v1[1] == y || v1[0] == i }

      return true
    end
  end
  false
end

# def player_creation_qualified(player_creation, filter_array)
#   player_creation.each_with_index do |_x, y|
#     p filter_array
#     break if filter_array.any? { |v| v[1] == y }

#     p 'true'
#     true
#   end
#   false
# end
# end
p exact_values(computer_guess, player_creation)
