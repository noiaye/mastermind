# frozen_string_literal: true

require_relative 'player'
require 'pry-byebug'

# The computerPLayer class, handles all things done by the computer player
class ComputerPlayer2 < PlayerClass
  def initialize
    super
    @algorithm_array = %w[nil nil nil nil]
    @occupied_places = []
  end
  attr_accessor :algorithm_array, :occupied_places

  def randomizecolors
    new_array = []
    colors = %w[red blue white yellow green pink black orange brown]
    4.times do |i|
      p i
      colors.shuffle!
      new_array.push(colors[i])
    end
    new_array
  end

  def random_guess(generated_colors)
    new_arr = []
    copy = generated_colors
    4.times do |i|
      copy.shuffle!
      new_arr.push(copy[i])
      # Numbers based sytem where 1 is for similar values and 2 and 3 is for something else? Maybe perform a double filter with 2 methods this one, and then another one for same vaue but different index.
    end
    new_arr
  end

  def perform_filter(player_creation, computer_guess)
    exact_values(computer_guess, player_creation)
    dif_index(computer_guess, player_creation)
    none_index(computer_guess, player_creation)
  end

  def exact_values(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i == y && occupied_places.include?(y) == false

        algorithm_array[i] = 1
        occupied_places.push(y)
        break
      end
    end
  end

  def dif_index(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places.include?(y) == false

        algorithm_array[i] = 2
        occupied_places.push(y)
      end
    end
  end

  def none_index(computer_guess, player_creation)
    computer_guess.each do |v, i|
      player_creation.each do |x, y|
        next unless v != x

        algorithm_array[i] = 3
        occupied_places.push(y)
      end
    end
  end
end

# TODO
# Make hint and values and index array simpler
#
computer_guess = %w[red red blue green]
player_creation = %w[red red blue red]
ComputerPlayer2.new('e', 'e').exact_values(computer_guess, player_creation)

# Conditions for win:
# All are 1
# Conditions for swap:
# Minimum 2 values either 2 or 3
# Conditions for change
# Minimum 1 three
#
# We go through all the values in the array and check
