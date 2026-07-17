# frozen_string_literal: true

require_relative 'player'
require 'pry-byebug'

# The computerPLayer class, handles all things done by the computer player
class ComputerPlayer2 < PlayerClass
  def initialize(game, marker)
    super
    @colored_peg = 0
    @white_peg = 0
    @algorithm_array = %w[nil nil nil nil]
    @occupied_places_f = []
    @occupied_places_h = []
  end
  attr_accessor :algorithm_array, :occupied_places_f, :colored_peg, :white_peg, :occupied_places_h

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

  def give_hint_exact(colors_guessed_array, secret_code_array)
    # Do

    colors_guessed_array.each_with_index do |v, i|
      secret_code_array.each_with_index do |x, y|
        next unless v == x && i == y && occupied_places_h.include?(y) == false

        self.colored_peg += 1
        occupied_places_h.push(y)
        break
      end
    end

    self.occupied_places_h = []

    colored_peg
  end

  def give_hint_white(colors_guessed_array, secret_code_array)
    colors_guessed_array.each_with_index do |v, i|
      secret_code_array.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places_h.include?(i) == false && occupied_places_h.include?(y) == false

        self.white_peg += 1
        occupied_places_h.push(y)
      end
    end

    # Temoporary
    self.occupied_places_h = []

    white_peg
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

    algorithm_array
  end

  def exact_values(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i == y && occupied_places_f.include?(y) == false

        algorithm_array[i] = 1
        occupied_places_f.push(y)
        break
      end
    end
  end

  def dif_index(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v == x && i != y && occupied_places_f.include?(i) == false && occupied_places_f.include?(y) == false

        algorithm_array[i] = 2
        occupied_places_f.push(y)
        break
      end
    end
  end

  def none_index(computer_guess, player_creation)
    computer_guess.each_with_index do |v, i|
      player_creation.each_with_index do |x, y|
        next unless v != x && occupied_places_f.include?(y) == false && occupied_places_f.include?(i) == false

        algorithm_array[i] = 3
        break
      end
    end
  end

  def display_colors
    puts 'red blue white yellow green pink black orange brown'
  end
end

# TODO
# Move over hint method from player.rb to computer_player.rb
# Check optimizations required
newPLayer = ComputerPlayer2.new('e', 'e')
computer_gen = %w[red red blue red]
player_guess = %w[red blue blue red]
whites = newPLayer.give_hint_white(player_guess, computer_gen)
colored = newPLayer.give_hint_exact(player_guess, computer_gen)

p colored
p whites
